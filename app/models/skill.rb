class Skill < ApplicationRecord
translates :name
def self.withpic
where('image is not null and length(image) > 0')
end
has_many :olympicpeople
has_many :findthebests, through: :olympicpeople, source: :findthebests
has_many :fightingpeople, through: :olympicpeople, source: :person
has_many :otherfightingpeople, through: :olympicpeople, source: :otherperson
has_many :skillhavesailors
has_many :people, through: :skillhavesailors
def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
end
def image
read_attribute(:image)
end

def self.findbyid(n)
where("id" => n)
end
def podiums
list1=Findthebest.where(id: self.findthebest_ids).knowp1.select{|x|Event.find(x.evid) rescue nil}.to_a.each {|x| p x.evid}.group_by {|x|Event.find(x.evid) rescue nil}.map do |event,x| 
ev=x.map{|y|[y.winner, y.p11,y.p22]}.map {|x|(x[0] == 1 ? [x[1],x[2],3] : [x[2],x[1],4]) }.sort {|a,b| a[2] <=> b[2]}.group_by {|x|x[0]}.each do |winner,other|
other.select{|v|v}.map{|u|Person.findbyid(Skill.competition2(winner,u).flatten)}.each{|xx| p "ok ok#{xx.as_json}"}.uniq.reduce(:+).uniq.flatten

end
ev2=ev.to_a.map {|a,b|a}+(ev.to_a.map {|a,b|b}.flatten-[3,4]).uniq
(0..(ev2.length - 1)).each_with_index do |id,ii|
f=ev2[id]
findp=Findthebest.knowp1.joinstwopeople(f)

#if findp.any? {|o|(o.p1 == f && o.p2 == ev2[(ii+1)] && o.winner == 1}

#elsif findp.any? {|o|(o.p2 == f && o.p1 == ev2[(ii+1)] && o.winner == 1}
if findp.any? {|o|f == o.loserid && ev2[(ii+1)] == o.winnerid}
ev2[ii], ev2[(ii+1)] = ev2[(ii+1)], ev2[ii]
end
end
[event,ev2.uniq.map{|x|Person.find(x)}.each_slice(3).to_a]


end

list1



end
def self.competition2(winner,x)
p "vriable #{x}"
p "winner #{winner}"
a=Findthebest.byid(Array.new(1,x[0])).knowp1.select{|x|x}.map {|x| [x.winner, x.p11,x.p22]}.map{|x|x[0] == 2 ? [x[1],x[2]] : [x[2],x[1]] }.sort {|a,b| a[0] <=> b[0]}.select{|x|x}
[a, x[1]]
end
def self.competition(x)
idsgagnants=x[1].map{|x|x[0]}
a=Findthebest.byid(idsgagnants).knowp1.select{|x|x}.map {|x| [x.winner, x.p11,x.p22]}.map{|x|x[0] == 2 ? [x[1],x[2]] : [x[2],x[1]] }.sort {|a,b| a[0] <=> b[0]}.select{|x|x}.map{|x|x[0]}
[x[2],a]
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end


end
