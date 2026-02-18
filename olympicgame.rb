require 'nokogiri'
require 'open-uri'
@yearbegin = 2000
@yearend = 2022
def lesmedailles(web)
p web.css('.Silver')[0].parent.parent.children.map(&:inner_html)
athleteargent=web.css('.Silver')[0].parent.parent.children[1].text
athleteor=web.css('.Gold')[0].parent.parent.children[1].text
athletebronze=web.css('.Bronze')[0].parent.parent.children[1].text
#result où les athèltes sont...
p "athlete or", athleteor
p "athlete argent", athleteargent
p "athlete bronze", athletebronze
[athleteargent,athleteargent, athletebronze]
end
def myrelayresult(res)
res.map! do |result|
if result["NOC"] != ""
@maposition = result["Pos"]
@maligne = result["Lane"]
@monpays = result["NOC"]
#@montemps = result["Time"]
nil
else
k=result.merge!("Pos" => @maposition,"Lane" => @maligne, "NOC" => @monpays)
k
end
end
res.select! {|h|h}
end
def datedesjeux(datejeux)
p datejeux
datefin=datejeux.split('–')[1].to_date rescue nil
p datefin
datedebut=datejeux.split('–')[0] rescue nil
p datedebut
mydatedebut=(datedebut.to_s.squish.to_s.strip.split(' ').length > 0 ? Date.strptime(datedebut.to_s.strip.squish, "%d %B") : "") rescue nil


p "date debut 1"
if mydatedebut.is_a?(Date)
deb= datefin.change(day: mydatedebut.day,month: mydatedebut.month)
else
p datefin
p datefin.day
p datedebut
p datedebut.to_i
p datefin.change(day: datedebut.to_i)
p datefin.change(year: (datefin.day == 1 && datefin.month == 1 ? (datefin.year - 1) : datefin.year))
p "===="
deb= datefin.change(day: datedebut.to_i,year: (datefin.day == 1 && datefin.month == 1 ? (datefin.year - 1) : datefin.year)) rescue nil
end
{:debut => (deb||datedebut), :fin => (datefin||datedebut)}
end
def chaqueresultatpage(page)

datejeux = page.css('td')[0].text
datej=datedesjeux(datejeux)
deb = datej[:debut]
datefin = datej[:fin]


coursesrelay(page)
#coursesnesontpasrelay(page)

end
def coursesrelay(page)
#courses relay
page.css('[href^=\'/results/\']').select{|t|t.text.include?("Relay")}.to_a.map {|t|"https://www.olympedia.org"+t.attributes['href'].value}.uniq.each do |t|
@web=Nokogiri::HTML(URI.open(t))
@titre=@web.css('h1').text
@titre1=@titre.split(', ')
@course=@titre1[0]
@sex=@titre1[1]
datejeux = page.css('td')[0].text
datej=datedesjeux(datejeux)
deb = datej[:debut]
datefin = datej[:fin]

@editionhaveevent=@myedition.editionshaveevents.find_or_create_by({
olympicevent: Olympicevent.find_or_create_by(name: @course),
sexe:  @sex,
date:  deb,
city:  City.find_or_create_by(name_en: page.css('[href^="/venues/"]').text.split(',').last)
})
@olev=@editionhaveevent.olympicevent
@editionhaveevent.country= @editionhaveevent.city.try(:country)
#def lengthtable
#@web.css('table')[1].css('tr').length
#end
#def tableauligne(n)
#@web.css('table')[1].css('tr')[n].css('td').map{|y|y.text}
#end
@olympicresults=@web.css('table').select{|r|r.css('th').to_a.map(&:text).include?("Lane")}.to_a.map do |web|
@nomcolonnestableau = web.css('th').to_a.map(&:text).to_a.map {|u|u.include?(' m') ? ('m'+u.gsub(' m','m').gsub(',','')) : u.gsub("(",'').gsub(")",'').gsub(' ','')}
@notemptystring=@nomcolonnestableau.length - @nomcolonnestableau.count("")
@nomcolonnestableau = @nomcolonnestableau.take(@notemptystring)
p @nomcolonnestableau

web.css('tr').to_a.map {|y|Hash[@nomcolonnestableau.zip(y.css('td').to_a.map(&:text).take(@notemptystring))].merge({"Medals" => lesmedailles(@web)})}.select{|t|t["Swimmer"]}
#, Medal: [y.css('.Gold'), y.css('.Silver'), y.css('.Bronze')]
end
p @olympicresults
@array={}
@web.css('h2, h3').to_a.map(&:text)[..-2].each do |t|
  @key = t if t.include?('Round') || t.include?('Final')
  @array[@key] ||= []
  @array[@key].push(t) if !(t.include?('Round') || t.include?('Final'))
end

@heatid=0
@array.each do |roundname,heats|
p roundname

@roundtype=Roundtype.find_or_create_by(name: roundname.split(' (')[0])
@mydate=roundname.split('(')[1].split('-')[0]
@round = @editionhaveevent.rounds.create(roundtype: @roundtype,begin: @mydate, end: @mydate) 
p "olympic_event", @olev, "edition", @myedition
if heats.length > 0
heats.each_with_index do |heat,myheatid|
p heat
@olympicres=@olympicresults[@heatid]

p " 1 ere ligne : la position, la ligne le pays et le temps "
p " autre ligne : nageur, temps, reaction et temps d'échange"
p @olympicres[0]
p @olympicres[1]
p "my result?"
myrelayresult(@olympicres)
p "eu result"
@myheatidvalue=myheatid
@kk=@olympicres.select{|y|y}.map{|h|@round.olympicresults.new(h.merge({heat: (myheatid + 1)}))}
@kk.each(&:save)
p "vient de creer resultat"
@heatid +=1 if @kk && @kk.length > 0
p "heat suivant"
end
else
@olympicres=@olympicresults[@heatid]
myrelayresult(@olympicres)
p @olympicres
p "final ou final B (#{roundname})"
@kk=@round.olympicresults.create!(@olympicres)
@heatid +=1 if @kk && @kk.length > 0

#
end

end
end
end
def coursesnesontpasrelay(page)

#courses pas relay

page.css('[href^=\'/results/\']').select{|t|!t.text.include?("Relay")}.to_a.map {|t|"https://www.olympedia.org"+t.attributes['href'].value}.uniq.each do |t|
@web=Nokogiri::HTML(URI.open(t))
@titre=@web.css('h1').text
@titre1=@titre.split(', ')
@course=@titre1[0]
@sex=@titre1[1]
datejeux = page.css('td')[0].text
datej=datedesjeux(datejeux)
deb = datej[:debut]
datefin = datej[:fin]

@editionhaveevent=@myedition.editionshaveevents.find_or_create_by({
olympicevent: Olympicevent.find_or_create_by(name: @course),
sexe:  @sex,
date:  deb,
city:  City.find_or_create_by(name_en: page.css('[href^="/venues/"]').text.split(',').last)
})
@editionhaveevent.country= @editionhaveevent.city.try(:country)
#def lengthtable
#@web.css('table')[1].css('tr').length
#end
#def tableauligne(n)
#@web.css('table')[1].css('tr')[n].css('td').map{|y|y.text}
#end
@olympicresults=@web.css('table').select{|r|r.css('th').to_a.map(&:text).include?("Lane")}.to_a.map do |web|
@nomcolonnestableau = web.css('th').to_a.map(&:text).to_a.map {|u|u.include?(' m') ? ('m'+u.gsub(' m','m').gsub(',','')) : u.gsub("(",'').gsub(")",'').gsub(' ','')}
@notemptystring=@nomcolonnestableau.length - @nomcolonnestableau.count("")
@nomcolonnestableau = @nomcolonnestableau.take(@notemptystring)
p @nomcolonnestableau
web.css('tr').to_a.map {|y|Hash[@nomcolonnestableau.zip(y.css('td').to_a.map(&:text).take(@notemptystring))]}.select{|t|t["Swimmer"]}
end
p @olympicresults
@array={}
@web.css('h2, h3').to_a.map(&:text)[..-2].each do |t|
  @key = t if t.include?('Round') || t.include?('Final')
  @array[@key] ||= []
  @array[@key].push(t) if !(t.include?('Round') || t.include?('Final'))
end

@heatid=0
@array.each do |roundname,heats|
p roundname

@roundtype=Roundtype.find_or_create_by(name: roundname.split(' (')[0])
@mydate=roundname.split('(')[1].split('-')[0]
@round = @editionhaveevent.rounds.create(roundtype: @roundtype,begin: @mydate, end: @mydate)
if heats.length > 0
heats.each_with_index do |heat,myheatid|
p heat
@olympicres=@olympicresults[@heatid]
@kk=@round.olympicresults.create!(@olympicres.to_a.map{|h|h.merge({heat: (myheatid + 1)})})
@heatid +=1 if @kk && @kk.length > 0
end
else
@olympicres=@olympicresults[@heatid]
p @olympicres
p "final ou final B (#{roundname})"
@kk=@round.olympicresults.create!(@olympicres)
@heatid +=1 if @kk && @kk.length > 0

#
end
end




end
end

@jeux=Nokogiri::HTML(URI.open("https://www.olympedia.org/editions/"))
@jeux.css("table")[0..0].each do |table|
table.css('tr')[1..].select {|x| x.css('td')[1].text.to_i > @yearbegin && x.css('td')[1].text.to_i < @yearend}.each do |row|
begin
row.css('[href^=\'/editions/\']').to_a.map {|t|"https://www.olympedia.org"+t.attributes['href'].value+"/sports/SWM"}.uniq.each do |t|
p t
@edition=Nokogiri::HTML(URI.open(t))
p "strip1"
@titre=@edition.css('h1').text.gsub("Swimming at the","").to_s.squish.to_s.strip
if @titre
p @titre

end
next if @titre.include?('Winter')
@olympicgame=Olympicgame.find_or_create_by(name: @titre,season: "S",year: @titre.split(' ')[0])
datejeux = @edition.css('td')[0].text
datej=datedesjeux(datejeux)
deb = datej[:debut]
datefin = datej[:fin]
@myedition=@olympicgame.editions.find_or_create_by(opened: deb, closed: datefin)
chaqueresultatpage(@edition)


rescue OpenURI::HTTPError
p "pas trouvé site"
end

end
end
rescue NoMethodError => e
p e.message
next
end


#def event(jeu)
#
#jeu.css("table")[0..0].each do |table|
#table.css('tr')[1..].select {|x| x.css('td')[1].text.to_i > @yearbegin && x.css('td')[1].text.to_i < @yearend}.each do |row|
#
#begin
#row.css('[href]').map {|t|"https://www.olympedia.org"+t.attributes['href'].value}.uniq.each do |t|
#p t
#@edition=Nokogiri::HTML(URI.open(t))
#@titre=@edition.css('h1')
#if @titre
#
#@event=@titre.text.split(', ')[0]
#@sex=@titre.text.split(', ')[1]
#
#end
#@editionhaveevent=@myedition.editionshaveevents.find_or_create_by do |t|
#t.olympicevent = Olympicevent.find_or_create_by(name: @event)
#t.sexe = @sex
#end
#end
#
#next if @titre.text.include?('Winter')
#rescue OpenURI::HTTPError
#p "pas trouvé site"
#end
#
#end
#end
#rescue NoMethodError => e
#p e.message
#next
#end





#@datejeux = @web.css('td')[0].text
#@datefin=@datejeux.split('––')[1]
#@datedebut=@datejeux.split('––')[0]
#@deb=@datedebut.to_i > 0 ? @datefin.change(day: @datedebut.to_i) : DateTime.strptime(@datedebut.strip.squish, "%d %B").to_date.change(year: (@datefin.day == 1 && @datefin.month == 1 ? (@datefin.year - 1) : @datefin.year))
############
#tous les jeux
#@jeux.css('[href^=\'/editions/\']').map {|t|"https://www.olympedia.org"+t.attributes['href'].value+"/sports/SWM"}.uniq.each do |t|
#p t
#@edition=Nokogiri::HTML(URI.open(t))
#@titre=@edition.css('h1')
#if @titre
#p @titre.text
#end
#rescue OpenURI::HTTPError
#p "pas trouvé site"
#end
