require 'nokogiri'
require 'open-uri'
@nomscript="***==Musiciens de Buenos Aires==***"
@url="http://violinbuenosaires.blogspot.com/2012/07/resultado-sorteo-de-orden-concursantes.html"
@doc=Nokogiri::HTML(URI.open(@url))
Person.where(description: "créé en utilisant le script #{@nomscript}").destroy_all
@doc.css('b span').each do |s|
  next if !s.text 
  p s.text
  @s1='–'
  @s2="-"
  if s.text && s.text.include?(@s1)
  t=s.text.split(@s1)
  t.shift
  t=t.join(@s1).squish.strip
    elsif s.text && s.text.include?(@s2)
  t=s.text.split(@s2)
  t.shift
  t=t.join(@s2).squish.strip
    end


  next if !t
  p t
@nomfamille=[]
@prenom=[]
t.split(' ').each do |r|
    if r.upcase == r
      @nomfamille.push(r)

    elsif !r.include?('(') && !r.include?(')')
      @prenom.push(r)
    end
  end
paysdorigine=t.split('(')[1].split(')')[0]
Person.create(name:t.split('(')[0], description: "créé en utilisant le script #{@nomscript}",firstnames: @prenom.join(' '), lastname: @nomfamille.join(' '),image: "",nationality: paysdorigine)
  break if t == "______________________________________________________"
  rescue NoMethodError
end
