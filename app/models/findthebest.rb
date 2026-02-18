class Findthebest < ApplicationRecord
belongs_to :olympicperson
has_one :skill,through: :olympicperson, source: :skill
has_one :twoperson,through: :olympicperson, source: :twoperson
belongs_to :user
validates_uniqueness_of :olympicperson_id, scope: :user_id
def losername
winner == 0 ? olympicperson.twoperson.person.name : olympicperson.twoperson.otherperson.name
end
def winnername
winner == 1 ? olympicperson.twoperson.person.name : olympicperson.twoperson.otherperson.name
end
def self.byid(i)
knowp1.joins('left join twopeople t on t.id = olymp.twoperson_id').joins('left join people p2 on p2.id = t.otherperson_id').joins('left join people p1 on p1.id = t.person_id').where(["(t.person_id in (#{Array.new(i.length,'?').join(',')}) or t.otherperson_id = (#{Array.new(i.length,'?').join(',')}))"]+i+i).select('findthebests.*,olymp.*, t.*,p1.*,p2.*,p1.id as p1,p2.id as p2,findthebests.winner as winner')

end

def self.knowp1
joins('left join olympicpeople olymp on findthebests.olympicperson_id = olymp.id').joins('left join olympicpeoplehaveevents ol on ol.olympicperson_id = olymp.id').joins('left join events ev on ev.id = ol.event_id').joins('left join twopeople tp on tp.id = olymp.twoperson_id').joins('left join people p11 on tp.person_id = p11.id').joins('left join people p22 on tp.otherperson_id = p22.id').select('olymp.*,ol.*,ev.*,findthebests.*,tp.*,p11.*,p22.*,p11.id as p11,p22.id as p22,findthebests.winner as winner,ev.id as evid,(case when winner = 2 then p22.id else p11.id end) as winnerid,(case when winner = 2 then p11.id else p22.id end) as loserid')

end
def self.joinstwoperson(i)
knowp1.where(['p1.id = ? or p2.id = ?',i,i])
end
def self.joinstwopeople(i)
knowp1.where(['p11.id = ? or p22.id = ?',i,i])
end

def self.firstloser(i)

if selectwinner[0]
p selectwinner[0]['p2']
p selectwinner[0]['winner']
p selectwinner[0]['p1']
end

ok=joinstwoperson(i).selectwinner.as_json.map do |x| 
p x
if x['winner'] == 2 && x['p1'] == i
p "winner = 2 et p1 = #{i}"
p "perdu"
[x['p2'],x['skillsid']]
elsif x['winner'] == 1 && x['p2'] == i
p "winner = 1 et p2 = #{i}"
p "perdu"
[x['p1'],x['skillsid']]
else
nil
end
end
ok.select {|d|d}



end
def self.firstwinner(i)
if selectwinner[0]
p selectwinner[0]['p2']
p selectwinner[0]['winner']
p selectwinner[0]['p1']
end
ok=joinstwoperson(i).selectwinner.as_json.map do |x| 
p x
if x['winner'] == 2 && x['p2'] == i
p "winner = 2 et p2 = #{Person.find(i).name}"
p "perdant = #{Person.find(x['p1']).name}"
[x['p1'],x['skillsid']]
elsif x['winner'] == 1 && x['p1'] == i
p "winner = 1 et p1 = #{Person.find(i).name}"
p "perdant = #{Person.find(x['p2']).name}"
[x['p2'],x['skillsid']]
#elsif x['winner'] == 2 && x['p1'] == i
#p "winner = 2 et p1 = #{i}"
#p "perdu"
#[x['p1'],x['skillsid']]
#elsif x['winner'] == 1 && x['p2'] == i
#p "winner = 1 et p2 = #{i}"
#p "perdu"
#[x['p2'],x['skillsid']]
else
nil
end
end
ok.select {|d|d}

end
def self.selectwinner
select('findthebests.*, olympicpeople.*, findthebests.winner as winner,twopeople.*, p1.*, p2.*, p2.id as p2, p1.id as p1, olympicpeople.skill_id as skillsid').joins(:twoperson, :skill).joins('left join people p1 on twopeople.person_id = p1.id').joins('left join people p2 on twopeople.otherperson_id = p2.id')
end


end
