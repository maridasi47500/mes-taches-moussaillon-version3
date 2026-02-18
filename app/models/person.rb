class Person < ApplicationRecord
def self.monautreliste
Person.all.left_joins(:olympicresults).left_joins(:actions).left_joins(:musicalinstruments).left_joins(:schools).select("people.*, (select count(olympicresults.id) from olympicresults where olympicresults.person_id = people.id) as olres, (select count(sailorjobs.id) from sailorjobs where sailorjobs.sailor_id = people.id) as mytask, (case when musicalinstrumentshaveplayers.id is not null then 3 else 0 end) as music, (case when schoolhpeople.id is not null then 3 else 0 end) as school").order('school desc,music desc, mytask desc, olres desc').group("people.id")
end
def self.listpeopleonmypage
olres="(case when olympicresults.id is not null then 1 else 0 end)"
school="(case when schoolhpeople.id is not null then 1 else 0 end)"
music="(case when musicalinstrumentshaveplayers.id is not null then 1 else 0 end)"
mytask="(case when tasks.id is not null then 1 else 0 end)"
sailor="(case when posts_surnames.sailor_id is not null then 1 else 0 end)"
destinataire="(case when posts_surnames.destinataire_id is not null then 1 else 0 end)"
stranger="(case when posts_surnames.stranger_id is not null then 1 else 0 end)"
avatar="(case when posts_surnames.speaklike_id is not null then 1 else 0 end)"
personsurname="(case when posts_surnames.person_id is not null then 1 else 0 end)"
Person.all.left_joins(:my_posts_surnames).left_joins(:my_posts_surname_destinataires).left_joins(:my_posts_surname_strangers).left_joins(:my_posts_surname_avatars).left_joins(:my_posts_surname_people).left_joins(:olympicresults).left_joins(:actions).left_joins(:musicalinstruments).left_joins(:schools).select("people.*, #{olres} as olres, #{mytask} as mytask, #{music} as music, #{school} as school, #{sailor} as sailor, #{destinataire} as destinataire, #{stranger} as stranger, #{avatar} as avatar, #{personsurname} as personsurname").order("olres desc,school desc,music desc,mytask desc,sailor desc, destinataire desc,stranger desc,avatar desc,personsurname desc").group("people.id")
end
  has_many :my_posts_surnames, :foreign_key => "sailor_id", class_name: 'PostsSurname'
  has_many :my_posts_surname_destinataires, :foreign_key => "destinataire_id", class_name: 'PostsSurname'
  has_many :my_posts_surname_strangers, :foreign_key => "stranger_id", class_name: 'PostsSurname'
  has_many :my_posts_surname_avatars, :foreign_key => "speaklike_id", class_name: 'PostsSurname'
  has_many :my_posts_surname_people, :foreign_key => "person_id", class_name: 'PostsSurname'
  accepts_nested_attributes_for :my_posts_surnames, allow_destroy: true
  has_many :my_posts, through: :my_posts_surnames, source: :post, class_name: 'Post'
def self.fromregiment
joins(:armycompagnies)
end
has_many :peoplehavelanguages
has_many :languages,through: :peoplehavelanguages

has_many :personarmycompagnies
has_many :armycompagnies, through: :personarmycompagnies
  has_many :sailorjobs, class_name: 'Sailorjob'
  has_many :todojobs, through: :sailorjobs, class_name: 'Task', source: :task
has_and_belongs_to_many :bacseries, :join_table => :peoplehavebacseries
attr_accessor :people, :person_ids
attr_accessor :countries, :country_ids
attr_accessor :thing_ids, :things
after_initialize :mycountries
before_validation :createdme, on: :create
def createdme
self.created_at=DateTime.now
end
before_validation :updateme, on: :update
def updateme
self.updated_at=DateTime.now
end
def self.todays
where("created_at > ? or updated_at > ?", DateTime.now.beginning_of_day, DateTime.now.beginning_of_day)
end
def countries
if !self.country_ids.nil? and self.country_ids.length > 0
Country.where(id: country_ids)
end
end
def things
if !self.thing_ids.nil? and self.thing_ids.length > 0
Thing.where(id: thing_ids)
end
end
def searchsailors
result=Person.group('people.id').maville(self.city_ids.without("")).monpays(self.country_ids.without("")).meschoses(self.thing_ids.without("")).mestaches(self.todojob_ids.without("")).mesactions(self.action_ids.without("")).mesinstruments(self.musicalinstrument_ids.without("")).select("*, count(distinct people.id) countall")
result.group_by{|g|[g.try(:nominstrument),g.try(:nomville),g.try(:nompays)].without(nil).to_sentence}
end
def self.mesinstruments(myids)
if myids.length > 0
joins("left join musicalinstrumentshaveplayers m on m.person_id = people.id").joins('left join things musici on musici.id = m.musicalinstrument_id').select('musici.name_'+I18n.locale.to_s+' as nominstrument').group('m.musicalinstrument_id').having(["m.musicalinstrument_id in (#{Array.new(myids.length, "?").join(',')})"]+myids)
else
select('*')
end
end
def self.mesactions(myids)
select('*')
end
def self.mestaches(myids)
select('*')
end
def self.meschoses(myids)
select('*')
end
def self.monpays(myids)
if myids.length > 0
joins(:country).group("countries.id").having(["countries.id in (#{Array.new(myids.length, "?").join(',')})"]+myids).select('countries.name_'+I18n.locale.to_s+' as nompays')
else
select('*')
end
end
def self.maville(myids)
if myids.length > 0
joins(:cities).group('cities.id').having(["cities.id in (#{Array.new(myids.length, "?").join(',')})"]+myids).select('cities.name_'+I18n.locale.to_s+' as nomville')
else
select('*')
end
end
def mycountries
self.countries ||= []
self.country_ids ||= []
end
has_many :actions, through: :todojobs, source: :taskactions

has_many :olympicresults, foreign_key: 'athlete_id'
has_many :rounds, through: :olympicresults, source: :round
has_many :medals, through: :olympicresults, source: :medal
has_many :editionshaveevents, through: :olympicresults, source: :editionshaveevent
has_many :olympicevents, through: :editionshaveevents, source: :olympicevent
has_many :sport_groups, through: :olympicevents, source: :sport_group
has_many :editions, through: :editionshaveevents, source: :edition
has_many :olympicgames, through: :editions, source: :olympicgame
has_many :nocs, through: :olympicresults, source: :noc
attr_accessor :addprofilepics
before_validation :addmyprofilepics
def monamour
love=['un peu','beaucoup','passionnement','a la folie','pas du tout']

i=inloves.last.try(:intensity)
i ? love[i] : "pasdutout"
end
def rbs
self.redbandpeople.length > 0 ? "yes" : "no"
end
def lgbt
self.lgbtpeople.length > 0 ? "yes" : "no"
end
attr_accessor :userid
def lgbt=(val)
if val=="yes"
@person.lgbtgens << [User.find(self.userid)]
else
@person.lgbtgens.where(id: self.userid).delete_all
end 
end

def robot
self.rrobots.where(user_id: self.userid).length > 0 ? "yes" : "no"
end
def robot=(val)
if val=="yes"
@person.robotgens << [User.find(self.userid)]
else
@person.robotgens.where(id: self.userid).delete_all
end 
end
def addmyprofilepics
self.addprofilepics.to_a.each do |h|
self.permanentprofilepictures.new(name: h,title: self.name)
self.myprofilepic = Profilepicture.new(name: h,title: self.name)
self.image = h
end

end
def self.byathlete
group('people.id')
end
def self.mymedalsbyathlete
medalsbyathlete.byathlete.limit(10).parcouleurmedaille('cl')
end
def self.medalsbyathlete
joins(:medals,:nocs).references(:medals,:nocs).select("countries.name_"+I18n.locale.to_s+" as countryname, countries.code as countrycode, people.name as athletename, cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = people.id and olympicmedals.color = 'br') as float) as bronzevalue, cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'ar') as float) * 2.3 as silvervalue, cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'or') as float) * 6.3 as goldvalue, (cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'br') as float)+ cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'ar') as float) * 2.4 +cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'or') as float) *6.3 ) as totalvalue, (select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'br') as bronze, (select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'ar') as silver, (select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.athlete_id = people.id and olympicmedals.color = 'or') as gold,count(distinct olympicmedals.id) as total")
end
def self.searchathlete(sport_id, sport_group_id,edition_id, competition_type_id, season_id, athlete_gender, gender, event_name_id, sort,limitathlete)
pardiscipline(sport_id).parsport(sport_group_id).paredition(edition_id).parcompetition(competition_type_id).parsaison(season_id).parcouleurmedaille(sort).parevenement(event_name_id).pargenre(gender).pargenredathlete(athlete_gender).joins('left join olympicresults on olympicresults.athlete_id = people.id').joins('left join olympicmedals on olympicmedals.olympicresult_id = olympicresults.id').joins('left join countries on countries.id = olympicresults.noc_id').joins('left join olympicmedals on olympicmedals.olympicresult_id = olympicresults.id').joins('left join rounds on olympicresults.round_id = rounds.id').joins('left join editionshaveevents on editionshaveevents.id = rounds.editionshaveevent_id').joins('left join olympicevents on olympicevents.id = editionshaveevents.olympicevent_id').joins('left join olympicsports on olympicsports.id = olympicevents.olympicsport_id').joins('left join sport_groups on sport_groups.id = olympicsports.sport_group_id').joins('left join editions on editionshaveevents.edition_id = editions.id').joins('left join olympicgames on olympicgames.id = editions.olympicgame_id').select('olympicmedals.*,people.*,olympicevents.*,sport_groups.*,editions.*,olympicgames.*,editionshaveevents.*,countries.id as countriesid, olympicresults.*').medalsbyathlete.byathlete.nombreathlete(limitathlete)


end
def self.nombreathlete(u)
case u
when "tous"
all
when "10"
limit(10)
when "25"
limit(25)
else
limit(10)
end
end
def self.pardiscipline(u)
if u && u.length > 0 
having('olympicevents.id = ?', u)
else
select('*')
end
end
def self.parsport(u)
if u && u.length > 0 
having('sport_groups.id = ?', u)
else
select('*')
end
end
def self.paredition(u)
if u && u.length > 0 
having('editions.id = ?', u)
else
select('*')
end
end
def self.parcompetition(u)
if u && u.length > 0 
having('olympicgames.id = ?', u)
else
select('*')
end
end
def self.parsaison(u)
if u && u.length > 0 
having('olympicgames.season = ?', u)
else
select('*')
end
end
def self.parcouleurmedaille(u)
case u
when 'or'
order('gold' => :desc)
when 'ar'
order('silver' => :desc)
when 'br'
order('bronze' => :desc)
when 'to'
order('total' => :desc)
when 'va'
order('goldvalue' => :desc,'silvervalue' => :desc, 'bronzevalue' => :desc, 'totalvalue' => :desc)
when 'cl'
order('gold' => :desc,'silver' => :desc, 'bronze' => :desc)
else
select('*')
end
end
def self.parevenement(u)
if u && u.length > 0 
having('editionshaveevents.id = ?', u)
else
select('*')
end
end
def self.pargenre(u)
if u && u.length > 0 
having('editionshaveevents.sexe = ?', u)
else
select('*')
end
end
def self.pargenredathlete(u)
if u && u.length > 0 
having('people.sexe = ?', u)
else
select('*')
end
end

def sexename
I18n.t('my.sexe.'+sexe)
end

def self.sexesolympiques
athletesolympiques.select('sexe').distinct.group('sexe').map{|y|[y.sexename,y.sexe]}
end
def self.athletesolympiques
all.joins(:editionshaveevents)
end
def sexedetouteslesfemmesathletes
Person.joins(:editionshaveevents).select('people.*,people.name, people.id, editionshaveevents.sexe as hishersexe').group('people.id').having('hishersexe = ? ','Women').each{|h|h.update(sexe: 'F')}
end

has_many :peoplehavefamousfriends
has_many :famousfriends, through: :peoplehavefamousfriends, source: :person

has_one :selfportrait, foreign_key: "sailor_id"
accepts_nested_attributes_for :selfportrait, allow_destroy: true

has_one :hairlength, through: :selfportrait
has_one :hairtype, through: :selfportrait
has_one :haircolor, through: :selfportrait
has_one :bodydescription, through: :selfportrait
has_one :faceshape, through: :selfportrait
has_one :skin_type, through: :selfportrait
has_one :skin_color, through: :selfportrait
has_one :makeupstyle, through: :selfportrait
has_one :eyecolor, through: :selfportrait
has_one :clothescolor, through: :selfportrait


attr_accessor :hiddenuserid
has_many :schoolhpeople
has_many :schools, through: :schoolhpeople

has_and_belongs_to_many :etnicities, :join_table => :peoplehaveetnicities
has_and_belongs_to_many :religions, :join_table => :peoplehavereligions
has_many :twopeople, source: :person
has_many :twopeoplebis, class_name: "Twoperson", source: :otherperson

has_many :linkfamilypeople, through: :twopeople,source: :linkfamilypeople
has_many :linkfamilypeoplebis, through: :twopeople,source: :linkfamilypeoplebis
has_many :linkfamilypeopleter, through: :twopeoplebis,source: :linkfamilypeople
has_many :linkfamilypeoplequat, through: :twopeoplebis,source: :linkfamilypeoplebis
before_validation :myhiddenuserid
def myhiddenuserid
p "hidden user id"
if self.hiddenuserid && self.peoplecars.length > 0
self.peoplecars.each do |y|
y.user_id = self.hiddenuserid
end
end
end
def ageonly
d1=self.dateofbirth
tod=Date.today
d1y=d1.year
d2y=tod.year
d1t=d1
d1t.change(year: d2y)
age=d2y - d1y
if d1t < tod
age=age - 1
end
age
end
def sonage

"#{ageonly} ans"
end 

def children
(linkfamilypeople.select('twopeople.*, twopeople.person_id as personid, twopeople.otherperson_id as otherpersonid, parentlinks.*, linkfamilypeople.*,parentlinks.name_en as nameen, parentlinks.name_fr as namefr, parentlinks.name_de as namede').joins(:twoperson,:familylink).group('linkfamilypeople.id').having(['nameen like ? or nameen like ?','%father%','%mother%']).having("personid = ?", self.id).map{|y|Person.find(y.otherpersonid)}.to_a + linkfamilypeople.select('twopeople.*, twopeople.person_id as personid, twopeople.otherperson_id as otherpersonid, parentlinks.*, linkfamilypeople.*,parentlinks.name_en as nameen, parentlinks.name_fr as namefr, parentlinks.name_de as namede').joins(:twoperson,:familylink).group('linkfamilypeople.id').having(['namefr like ? or namefr like ?','%fils%','%fille%']).having("otherpersonid = ?", self.id).map{|y|Person.find(y.personid)}.to_a).uniq+(linkfamilypeoplebis.select('twopeople.*, twopeople.person_id as personid, twopeople.otherperson_id as otherpersonid, parentlinks.*, linkfamilypeople.*,parentlinks.name_en as nameen, parentlinks.name_fr as namefr, parentlinks.name_de as namede').joins(:twoperson,:familylink).group('linkfamilypeople.id').having(['nameen like ? or nameen like ?','%father%','%mother%']).having("personid = ?", self.id).map{|y|Person.find(y.otherpersonid)}.to_a + linkfamilypeoplebis.select('twopeople.*, twopeople.person_id as personid, twopeople.otherperson_id as otherpersonid, parentlinks.*, linkfamilypeople.*,parentlinks.name_en as nameen, parentlinks.name_fr as namefr, parentlinks.name_de as namede').joins(:twoperson,:familylink).group('linkfamilypeople.id').having(['namefr like ? or namefr like ?','%fils%','%fille%']).having("personid = ?", self.id).map{|y|Person.find(y.otherpersonid)}.to_a).uniq
end
def parentsf
Person.where(id: self.id).joins('left join twopeople l on l.person_id = people.id or l.otherperson_id = people.id').joins('left join linkfamilypeople m on m.twoperson_id = l.id').joins('left join parentlinks f on f.id = m.familylink_id').select('p1.*,p2.*,f.*,l.*,m.*,people.*,f.name_en as nameen,p1.name as p1name, p2.name as p2name,p1.id as p1id,p2.id as p2id,l.id as lid').where('nameen like ? or nameen like ?','%mother%','%father%').joins('left join people p1 on p1.id = l.person_id').joins('left join people p2 on p2.id = l.otherperson_id').group('lid').where('(p1id = ? and p2id != ?) or (p2id = ? and p1id != ?)', self.id,self.id,self.id,self.id)

end
def membresfamille
Person.where(id: self.id).joins('left join twopeople l on l.person_id = people.id or l.otherperson_id = people.id').joins('left join linkfamilypeople m on m.twoperson_id = l.id').joins('left join parentlinks f on f.id = m.familylink_id').select('p1.*,p2.*,f.*,l.*,m.*,people.*,people.id as personid,f.name_en as nameen,f.name_fr as namefr,p1.name as p1name, p2.name as p2name,p1.id as p1id,p2.id as p2id,l.id as lid').joins('left join people p1 on p1.id = l.person_id').joins('left join people p2 on p2.id = l.otherperson_id').group('lid').where('(p1id = ? and p2id != ?) or (p2id = ? and p1id != ?)', self.id,self.id,self.id,self.id)
end
def self.tousfreressoeurs
#tousfreressoeurs pour tous les freres et soeurs
self.parentsf.childrenf
end
def epoux
self.membresfamille.having("(namefr like '%épou%' ) ").map{|y|y.p2id == self.id ? [y.sexe1, y.p1name1] : [y.sexe2, y.p2name2]}
end

def hisbrosis
self.parentsf.childrenf.having("((nameen like '%father%' or nameen like '%mother%') and p2id2 not in (p1id, p2id)) or ((nameen like '%daughter%' or nameen like '%son%') and p1id1 not in (p1id, p2id))").map{|y|y.p2id2 == self.id ? [y.sexe1, y.p1name1] : [y.sexe2, y.p2name2]}
end
def self.childrenf
joins('left join twopeople ll on ll.person_id = p1id or ll.person_id = p2id or ll.otherperson_id = p1id or ll.otherperson_id = p2id').joins('left join linkfamilypeople mm on mm.twoperson_id = ll.id').joins('left join parentlinks ff on ff.id = mm.familylink_id').select('pp1.*,pp2.*,f.*,ll.*,mm.*,ff.name_en as nameen1,pp1.name as p1name1, pp2.name as p2name2,pp1.id as p1id1,pp2.id as p2id2, pp2.sexe as sexe2, pp1.sexe as sexe1').where('nameen1 like ? or nameen1 like ?','%mother%','%father%').joins('left join people pp1 on pp1.id = ll.person_id').joins('left join people pp2 on pp2.id = ll.otherperson_id')
end
def self.theirchildren
Person.where(id: childrenf.map{|y|y.p1id1 == self.id ? y.p2id2 : y.p1id1})
end
def fille?
sexe='%fille%'
n=Person.where(id: self.id).joins('left join twopeople l on l.person_id = people.id or l.otherperson_id = people.id').joins('left join linkfamilypeople m on m.twoperson_id = l.id').joins('left join parentlinks f on f.id = m.familylink_id').select('p1.*,p2.*,f.*,l.*,m.*,people.*,f.name_en as nameen,p1.name as p1name, p2.name as p2name,p1.id as p1id').where('lower(nameen) like ?',sexe).joins('left join people p1 on p1.id = l.person_id').joins('left join people p2 on p2.id = l.person_id')
n.length > 0
end
def fils?
sexe='%fils%'
n=Person.where(id: self.id).joins('left join twopeople l on l.person_id = people.id or l.otherperson_id = people.id').joins('left join linkfamilypeople m on m.twoperson_id = l.id').joins('left join parentlinks f on f.id = m.familylink_id').select('p1.*,p2.*,f.*,l.*,m.*,people.*,f.name_en as nameen,p1.name as p1name, p2.name as p2name,p1.id as p1id').where('lower(nameen) like ?',sexe).joins('left join people p1 on p1.id = l.person_id').joins('left join people p2 on p2.id = l.person_id')
n.length > 0

end
def astrosign
mysign=""
signs={"Aries"=>"March 21 - April 20",
"Taurus" => "April 21 - May 21",
"Gemini"=>"May 22 - June 21",
"Cancer" =>	"June 22 - July 22",
"Leo"=>	"July 23 - August 23",
"Virgo"=>	"August 24 - September 23",
"Libra"=>	"September 24 - October 23",
"Scorpius"=>	"October 24 - November 22",
"Sagittarius"=>	"November 23 - December 21",
"Capricornus"=>	"December 22 - January 20",
"Aquarius"=>	"January 21 - February 19",
"Pisces"=>	"February 20 - March 20"
}
k=self.dateofbirth rescue nil
if k
l=k.year
signs.to_a.each do |sign, date|
d=date.split(' - ')
d1=d[0].to_date.change(year: l)

d2=d[1].to_date.change(year: l)
if d1.month > d2.month
d2=d2.change(year: (l+1))
end
p "#{d1} - #{d2}"
if k >= d1 && k <= d2
mysign= sign
sign
end
end


end
mysign
end
def parents
pp=self.parentsf
Person.findbyid(pp.as_json.pluck('p1id'))
end
def hisparents
parentsf.where('p1id != ?', self.id).as_json.pluck("name_#{I18n.locale}","p1name")
end

belongs_to :cityofbirth, class_name: "City", optional: true
has_many :people_cities

has_many :cities, :through => :people_cities
has_and_belongs_to_many :collections, :join_table => :collectionpeople, class_name:'Collection'
has_many :personhavelifestates
has_many :lifestates, :through => :personhavelifestates
has_many :someonephotos, :through => :personhavelifestates, source: :photos
has_many :someonerequests, :through => :personhavelifestates, source: :requeststopeople
attr_accessor :form_note, :myuserid
has_many :beautifulpeople
before_validation :beauty
def beauty
if form_note && myuserid
beautifulpeople.new(user_id: myuserid, note: form_note)
end
end
def femme=(f)
if f
write_attribute(:sexe, 'F')
end
end
def homme=(m)
if m 
write_attribute(:sexe, 'M')
end
end

has_many :surnamehavepeople
has_many :surnames, through: :surnamehavepeople

has_and_belongs_to_many :newspapers, :join_table => :newspaperwriters, class_name: 'Newspaper'

has_and_belongs_to_many :musicalinstruments, :join_table => :musicalinstrumentshaveplayers, class_name: 'Musicalinstrument'

has_many :companieshaveemployees, foreign_key: 'employee_id'
has_many :ccompanies, through: :companieshaveemployees, source: :company
has_many :interestedpeople
#before_validation :mesphotosavatar
def somerequestswithlifestate(myid)
Requeststoperson.joins(:lifestates, :somepeople).select('requeststopeople.*, things.id as lifestateid, people.id as personid').where('personid = ? and lifestateid = ?',self.id,myid)
end
def somephotoswithlifestate(myid)
Photo.joins(:lifestates, :somepeople).select('photos.*, things.id as lifestateid, people.id as personid').where('personid = ? and lifestateid = ?',self.id,myid)
end
def self.somephotospersonlifestate
Photo.joins(:lifestates, :somepeople).select('photos.*, things.id as lifestateid, people.id as personid')
end
def mesphotosavatar
if self.myprofilepic && !Newprofilepicture.find_by(profilepicture: self.myprofilepic, person: self)
k=Newprofilepicture.create(profilepicture: self.myprofilepic, person: self) 
end
rescue => e
 e.message
end
accepts_nested_attributes_for :interestedpeople
def ccompaniesnot(myids)
ccompanies.where.not(id: myids)
end
def self.premiersmoussaillons
Person.where(id: Person.all.joins(:todojobs).group('people.id').select('people.id as myid, count(people.id) as ok').order('ok' => :desc).map{|x|x.myid}[0..9])

end
def ccompaniesspecial(p1,p2,myids)
k=p1 == self ? p2 : p1
k.ccompanies.where(id: myids)
end
has_many :cjobs, through: :companieshaveemployees, source: :job
def cjobsnot(myids)
cjobs.where.not(id: myids)
end
def cjobsspecial(p1,p2,myids)
k=p1 == self ? p2 : p1
k.cjobs.where(id: myids)
end
has_many :pcities, class_name: 'City', through: :people_cities, source: :city
def pcitiesnot(myids)
pcities.where.not(id: myids)
end
def pcitiesspecial(p1,p2,myids)
k=p1 == self ? p2 : p1
k.pcities.where(id: myids)
end

has_many :personhassosies
has_many :sosies, through: :personhassosies
has_many :peoplehavejobs
has_many :jobs, through: :peoplehavejobs

has_many :ecartages
has_many :compar2, through: :ecartages, source: :person
has_many :compar1, through: :ecartages, source: :otherperson
def self.birthdaytoday
k=Date.today
where(dateofbirth: (1900..k.year).map {|x|Date.new(x,k.month,k.day)})
end
def self.findbynamedatebirth(j)
self.findbyname(params[:name]).where('dateofbirth is not null')

end
def comparages
Person.joins('left join ecartages on ecartages.person_id = people.id or ecartages.otherperson_id = people.id').select('ecartages.*, people.*').where(['ecartages.person_id = ? or ecartages.otherperson_id = ?',self.id,self.id]).group('people.id').where('people.id is not null')
end

has_many :traumberufe, class_name: 'Traumberuf'
has_many :dreamjobs, through: :traumberufe, source: :job

has_many :twopeoplea, source: :person, class_name: "Twoperson"
has_many :olympicpeoplea,class_name:"Olympicperson", through: :twopeoplea, source: :olympicpeople
has_many :findthebestsa, through: :olympicpeoplea, source: :findthebests
has_many :twopeopleb, source: :otherperson, class_name: "Twoperson"
has_many :olympicpeopleb,class_name:"Olympicperson", through: :twopeopleb, source: :olympicpeople
has_many :findthebestsb, through: :olympicpeopleb, source: :findthebests
def mysexedisplayspecde
if self.sexe == 'F'
'defille'
elsif self.sexe == 'M'
'degarcon'
else
'delleoului'
end
end
def mysexedisplayspec
if self.sexe == 'F'
'lafille'
elsif self.sexe == 'M'
'legarcon'
else
'elleoului'
end
end
def aken

messkills=Findthebest.firstwinner(self.id)
messkills.select {|x|x[1]}.group_by {|x| Skill.find(x[1])}.to_a
end
def sizeinm
k=self.size.to_f/100
k.to_s + " m"
end
def size=(x)
i=x.to_i == 0 ? nil : x 
write_attribute(:size,i)
end
def size
read_attribute(:size)
end
def jealous

messkills=Findthebest.firstloser(self.id)


messkills.select {|x|x[1]}.group_by {|x| Skill.find(x[1])}.to_a
end
#has_many :skills, through: :olympicpeople

has_many :githubaccounts, foreign_key: 'owner_id'
accepts_nested_attributes_for :githubaccounts, allow_destroy: true
has_many :skillhavesailors
has_many :skills, through: :skillhavesailors


has_many :linkspousepeople
def sisters
q=Person.nbgensfamille.where('fam.name_de = ?','Geschwister').where(['p1.id = ? or p2.id = ?',self.id,self.id]).where(['(p1.sexe = ? and p1.id != ?) or (p2.sexe = ? and p2.id != ?)','F',self.id,'F',self.id]).map do |x|
if x.p2 == self.id
x.p1
else
x.p2
end

end
Person.findbyid(q)
end
    #def girlfriends

    #q=Person.nbgenscouple.where(['lov.name_en = ? or lov.name_fr = ? or lov.name_fr = ?','lovers','lesbiennes','union libre']).where(['p1.id = ? or p2.id = ?',self.id,self.id]).where(['(p1.sexe = ? and p1.id != ?) or (p2.sexe = ? and p2.id != ?)','F',self.id,'F',self.id]).currentlove.map do |x|
    #if x.p2 == self.id
    #x.p1
    #else
    #x.p2
    #end

    #end
    #Person.findbyid(q)
    #end
#def boyfriends

#q=Person.nbgenscouple.where(['lov.name_en = ? or lov.name_fr = ? or lov.name_fr = ?','lovers','lesbiennes','union libre']).where(['p1.id = ? or p2.id = ?',self.id,self.id]).where(['(p1.sexe = ? and p1.id != ?) or (p2.sexe = ? and p2.id != ?)','M',self.id,'M',self.id]).currentlove.map do |x|
#if x.p2 == self.id
#x.p1
#else
#x.p2
#end

#end
#Person.findbyid(q)
#end
def self.currentlove
where('ll.begindating < ? and ll.enddating is null',DateTime.now)
end
#def boyfriends
#q=Person.nbgenscouple.where('lov.name_en = ?','lovers').where(['p1.id = ? or p2.id = ?',self.id,self.id]).where(['(p1.sexe = ? and p1.id != ?) or (p2.sexe = ? and p2.id != ?)','M',self.id,'M',self.id]).currentlove.map do |x|
#if x.p2 == self.id
#x.p1
#else
#x.p2
#end

#end
#Person.findbyid(q)
#end
def brothers
q=Person.nbgensfamille.where('fam.name_de = ?','Geschwister').where(['p1.id = ? or p2.id = ?',self.id,self.id]).where(['(p1.sexe = ? and p1.id != ?) or (p2.sexe = ? and p2.id != ?)','M',self.id,'M',self.id]).map do |x|
if x.p2 == self.id
x.p1
else
x.p2
end

end
Person.findbyid(q)
end
def allherlovers
Person.findbyid(Person.nbgenscouple.group('ll.id').having('llid is not null').as_json.select{|h|h['p1'] == person.id || h['p2'] == person.id}.map {|y| y['p2'] == person.id ? y['p1'] : y['p2']})
end


def alllovers
Person.nbgenscouple.group('ll.id').having('llid is not null').as_json.select{|h|h['p1'] == person.id || h['p2'] == person.id}.pluck('p1name','p2name')
end
def self.nbgenscouple
Person.joins('left join twopeople l on l.person_id = people.id or l.otherperson_id = people.id').joins('left join linkspousepeople ll on ll.twoperson_id = l.id').joins('left join parentlinks lov on ll.spouselink_id = lov.id').joins('left join people p1 on p1.id = l.person_id').joins('left join people p2 on p2.id = l.otherperson_id').select('people.id as id, people.id as pid,lov.name_'+I18n.locale.to_s+' as statutrelation,p1.id as p1,ll.begindating as begindating, ll.enddating as enddating,p2.id as p2, p1.name as p1name,p2.name as p2name,p1.sexe as p1sexe, p2.sexe as p2sexe,ll.id as llid').group('pid').having('begindating is not null and enddating is null')


end
def boyfriends
Person.where.not("people.id" => self.id).nbgenscouple.where(['(p1 = ? and p2sexe = ?) or (p2 = ? and p1sexe = ?)',self.id, 'M', self.id, 'M'])
end
def girlfriends
Person.nbgenscouple.having("pid <> ?", self.id).where(['(p1 = ? and p2sexe = ?) or (p2 = ? and p1sexe = ?)',self.id, 'F', self.id, 'F'])
end
def self.nbgensfamille
joins('left join twopeople l on l.person_id = people.id or l.otherperson_id = people.id').joins('left join linkfamilypeople ll on ll.twoperson_id = l.id').joins('left join parentlinks fam on ll.familylink_id = fam.id').joins('left join people p1 on p1.id = l.person_id').joins('left join people p2 on p2.id = l.otherperson_id').select('fam.*, people.*,l.*,ll.*,p1.*,p2.*,p1.id as p1,p2.id as p2, p1.name as p1name,p2.name as p2name,p1.sexe as p1sexe, p2.sexe as p2sexe')


end
has_many :sailorhaveattitudesintasks, foreign_key: 'person_id'
has_many :artistpeople, foreign_key: 'person_id'
has_many :artspratiques, :source => "artobject",:through => :artistpeople, class_name: 'Artobject'
belongs_to :nationality, optional: true

def githubnew
self.githubaccounts.new(nameowner: self.name)
end
def twitternew
self.twitteraccounts.new(name: self.name)

end
def has_currently_lover?
linkspousepeople.select('linkspousepeople.begindating as begin, linkspousepeople.enddating as end').select {|x|x.begin && !x.end}.length > 0
rescue
false
end
def mylinkspousepeople
Person.where("people.id" => self.id).joins('left join twopeople t on t.person_id = people.id or t.otherperson_id = people.id').joins('left join linkspousepeople l on l.twoperson_id = t.id').select('people.*, t.*, l.*, l.begindating as begin, l.enddating as end, t.person_id as personid, t.otherperson_id as otherpersonid')
end
def current_lover
mylinkspousepeople.select {|x|x.begin && !x.end}[0] || mylinkspousepeople[0]
rescue
mylinkspousepeople.first
end
def originnation
if nationality
nationality.name
elsif cityofbirth
cityofbirth.nationality.try(:name)
elsif city
city.nationality.try(:name)
end
end
def my_current_lover
Linkspouseperson.find((mylinkspousepeople.select {|x|x.begin && !x.end}[0].id || mylinkspousepeople[0].id))
rescue
Linkspouseperson.find(mylinkspousepeople.first.id)
end

def currentlover
j=current_lover
jperson=Person.find(j.personid)
jotherperson=Person.find(j.otherpersonid)
jperson == self ? jotherperson : jperson
end

def bi
linkspousepeople.joins('left join twopeople tp on tp.id = linkspousepeople.twoperson_id').joins('left join people otherperson on otherperson.id = tp.otherperson_id').joins('left join people person on person.id = tp.person_id').select('otherperson.sexe as sexeperson1, person.sexe as sexeperson2').select {|x|x.sexeperson1 == x.sexeperson2}.length > 0 && linkspousepeople.joins('left join twopeople tp on tp.id = linkspousepeople.twoperson_id').joins('left join people otherperson on otherperson.id = tp.otherperson_id').joins('left join people person on person.id = tp.person_id').select('people.*,linkspousepeople.*,otherperson.sexe as sexeperson1, person.sexe as sexeperson2').select {|x|x.sexeperson1 != x.sexeperson2}.length > 0
rescue
[]
end
def hetero
linkspousepeople.joins('left join twopeople tp on tp.id = linkspousepeople.twoperson_id').joins('left join people otherperson on otherperson.id = tp.otherperson_id').joins('left join people person on person.id = tp.person_id').select('otherperson.sexe as sexeperson1, person.sexe as sexeperson2').select {|x|x.sexeperson1 == x.sexeperson2}.length == 0 && linkspousepeople.joins('left join twopeople tp on tp.id = linkspousepeople.twoperson_id').joins('left join people otherperson on otherperson.id = tp.otherperson_id').joins('left join people person on person.id = tp.person_id').select('otherperson.sexe as sexeperson1, person.sexe as sexeperson2').select {|x|x.sexeperson1 != x.sexeperson2}.length > 0
end

def homo
linkspousepeople.joins('left join twopeople tp on tp.id = linkspousepeople.twoperson_id').joins('left join people otherperson on otherperson.id = tp.otherperson_id').joins('left join people person on person.id = tp.person_id').select('otherperson.sexe as sexeperson1, person.sexe as sexeperson2').select {|x|x.sexeperson1 != x.sexeperson2}.length > 0
end
def musicianpeople
artistpeople.joins(:musicalinstrument)
end
def geekpeople
artistpeople.joins(:programminglanguage)
end
def self.nbpages
(all.length / 20).to_i
end
def self.bypage(i)
all.limit(20).offset(i * 20)
end
def artisticpeople
artistpeople.joins(:ustensile)
end
def self.findbyid(i)
where(id: i)
end
has_many :musicalinstrumentspratiques, :source => "artobject",:through => :artistpeople, class_name: 'Musicalinstrument'
  has_many :attitudefilms,  foreign_key: 'person_id'
  has_many :acteursfilmsattitudes, :source => "user",:through => :attitudefilms, class_name: 'User'
  has_many :attitudetvseries,  foreign_key: 'person_id'
  has_many :acteursseriesattitudes, :source => "user",:through => :attitudetvseries, class_name: 'User'
  has_many :answerpeople,  foreign_key: 'person_id'
  has_many :redbandpeople,  foreign_key: 'person_id'
  has_many :braceletgens, :source => "user",:through => :redbandpeople, class_name: 'User'

  has_many :peoplecars,  foreign_key: 'person_id'
  has_many :mavoituregens, :source => "user",:through => :peoplecars, class_name: 'User'
  has_many :marquevoituregens, :source => "car",:through => :peoplecars, class_name: 'Car'
  has_many :inloves,  foreign_key: 'person_id'
  has_many :amoureuxgens, :source => "user",:through => :inloves, class_name: 'User'
  has_many :lgbtpeople,  foreign_key: 'person_id'
  has_many :lgbtgens, :source => "user",:through => :lgbtpeople, class_name: 'User'
  has_many :rcars,  foreign_key: 'person_id'
  has_many :voituregens, :source => "user",:through => :rcars, class_name: 'User'
  has_many :rrobots,  foreign_key: 'person_id'
  has_many :robotgens, :source => "user",:through => :rrobots, class_name: 'User'
  has_many :peoplebelievers,  foreign_key: 'person_id'
  has_many :croyantgens, :source => "user",:through => :peoplebelievers, class_name: 'User'
  has_many :savedpeople,  foreign_key: 'person_id'
  has_many :sauvegens, :source => "user",:through => :savedpeople, class_name: 'User'
  has_many :peoplelike,  foreign_key: 'person_id'
  has_many :aimegens, :source => "user",:through => :peoplelike, class_name: 'User'
  has_many :peopledontlike, foreign_key: 'person_id'
  has_many :aimepasgens, :source => "user", :through => :peopledontlike,  class_name: 'User'

  has_many :phavefilms
  has_many :films, :through => :phavefilms
  has_many :tvserieshaveactors
  accepts_nested_attributes_for :tvserieshaveactors
  has_many :tvseries, :through => :tvserieshaveactors, class_name: "Tvseries"

  has_and_belongs_to_many :phrases, :join_table => :peoplesentences, :class_name => 'Recording'
  has_and_belongs_to_many :mynames, :join_table => :peoplerecordings, :class_name => 'Recording'
  has_and_belongs_to_many :aidememoires, :join_table => :peoplehavephrasesandwords
  has_and_belongs_to_many :usedprofilepictures, :join_table => :profilepicsforpeople, class_name: "Profilepicture"
      has_and_belongs_to_many :profilepics, join_table: :currentprofilephotos, class_name: 'Profilepicture'
  has_and_belongs_to_many :permanentprofilepictures, :join_table => :permanentprofilepics, class_name: "Profilepicture"
  before_validation :savephrasesandwords, :on =>[:create, :update]
  after_validation :saveimage, :on =>[:create, :update]
  #after_save :saveimage

  belongs_to :myprofilepic, class_name: "Profilepicture", optional: true
  has_many :albums
  has_many :album_photos, through: :albums, source: :photos
  has_and_belongs_to_many :scheduledtasks, :join_table => :peopleschedules
  accepts_nested_attributes_for :scheduledtasks #,  :allow_destroy => true
  has_and_belongs_to_many :facts
  has_many :posts_surnames
  has_many :postsfrompostssurnames, through: :posts_surnames, source: :post
  has_and_belongs_to_many :places
  has_many :profilepictures, through: :albums, source: :profilepictures
  accepts_nested_attributes_for :profilepictures
has_and_belongs_to_many :reactions
  has_one :wikipedia_page
  accepts_nested_attributes_for :wikipedia_page
belongs_to :pronoun, optional: true
has_many :onetimes
accepts_nested_attributes_for :onetimes, allow_destroy: true
has_and_belongs_to_many :collections

  has_many :postsabouttasks, through: :todojobs, source: :posts
has_many :sailorsdoingthejobs, through: :sailorjobs, source: :sailor
has_and_belongs_to_many :surnames
  has_and_belongs_to_many :relatedtasks, class_name: 'Task'
  has_and_belongs_to_many :relatedevents, class_name: 'Event'
#comment par trouver le user à partir du person si il y en a 
  has_many :aliasesrecords, class_name: 'Alias'
  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords
has_many :aliases, class_name: 'User', through: :aliasesrecords

  has_many :tablecommeelles, class_name: "Usurpation", foreign_key: 'post_id'
  has_many :twitteraccounts
  accepts_nested_attributes_for :twitteraccounts, allow_destroy: true
  has_many :postswithmentions, through: :tablecommeelles, class_name: 'Post'
  #has_many :currentprofilephotos

  #has_many :currentprofilepictures, class_name: 'Profilepicture', through: :currentprofilephotos
      has_and_belongs_to_many :mycurrentprofilepictures, join_table: :currentprofilephotos, class_name: 'Profilepicture'

  belongs_to :country, optional: true
  belongs_to :city, optional: true
  
  has_many :ticketshavesenders, foreign_key: "ticket_id"
  has_many :senttickets, :through => :ticketshavesenders
  has_many :ticketshaverecipients, foreign_key: "ticket_id"
  has_many :receivedtickets, :through => :ticketshaverecipients
def name
read_attribute(:name)
end
def name=(x)
write_attribute(:name,x.strip.squish)
end
def self.findactor(tv,namesailor,film)
    name=namesailor.to_s
    name='%'+name.downcase.gsub(' ','%')+'%'

   joins('left join phavefilms f on f.person_id = people.id').joins('left join tvserieshaveactors tv on tv.person_id = people.id').joins('left join things ser on ser.id = tv.tvseries_id').select('f.person_id as personidfilm,f.id as fid, f.film_id as filmid, people.id as pid,tv.person_id as tvpersonid, tv.tvseries_id as tvseriesid,ser.id as serid,people.name,people.image,people.id as id').where(["(lower(people.name) like ? and tv.tvseries_id = ?) or (lower(people.name) like ? and f.film_id = ?)",name,tv,name,film])


end
def self.lookforname(n)
      s="%#{n.squish.strip.downcase.gsub(' ','%')}%"
      Person.joins('left join tvserieshaveactors a on a.person_id = people.id').joins('left join surnames on surnames.id = a.surname_id').select('people.*, surnames.*,a.*,(case when people.name is not null then people.name else surnames.name end) as name,people.id').where('lower(surnames.name) like ? or lower(people.name) like ? or lower(people.lastname) like ? or lower(people.firstnames) like ?',s,s,s,s)
end
def self.bynameorcollection(n,c)
      if n
      s="%#{n.squish.strip.gsub(' ','%')}%"
      Person.where('lower(name) like ? or lower(lastname) like ? or lower(firstnames) like ?',s,s,s)

      elsif c
        co=Collection.find(c)
        co.people
      end

end
  def self.findbyid(n)
    Person.where('id' => n)
  end
  def self.find1pplbyid(n)
    Person.where('id' => n)
  end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n2=I18n.transliterate(n1)
    str1='lower(name) like ? or lower(firstnames) like ? or lower(lastname) like ?'
    Person.where([str1+' or '+str1]+Array.new(3,n1)+Array.new(3,n2))
    else
    []
    end
  end
  def self.find1ppl(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n2=I18n.transliterate(n1)
    str='lower(name) like ? or lower(firstnames) like ? or lower(name) like ?'
    Person.where([Array.new(2,str).join(' or ')]+Array.new(3,n1)+Array.new(3,n2))
    else
    []
    end
  end

  def self.sortalphabetical
    order(name: :asc)
  end
    def self.findthem(o)
      #joins('left join events place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('posts_surnames.*,avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid').where(['avatar.name like ? or posts_surnames.content_fr like ? or posts_surnames.content_en like ? or posts_surnames.content_de like ? or rec.name like ? or s.name like ? or t.name like ? or pp.nameimage like ? or place.name like ?']+Array.new(9,o))
    joins('left join tasks place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar2 on posts_surnames.speaklike_id = avatar2.id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('posts_surnames.*,avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid, (case when s.name is not null and length(s.name) > 0 then s.name else avatar2.name end) as myname1').where(['length(s.name) > 0 and avatar.name like ? or posts_surnames.content_fr like ? or posts_surnames.content_en like ? or posts_surnames.content_de like ? or rec.name like ? or s.name like ? or t.name like ? or pp.title like ? or place.name like ? or avatar2.name like ?']+Array.new(10,o))

  end

  def celebrity
    
  end
  def imagechevalier
    "/assets/chevalier.png"
  end
  def imagemaillot
    self.sexe == "F" ? "/assets/maillotfemme.png" : "/assets/maillothomme.png"
  end
  def saveimage
if self.myprofilepic
self.image=self.myprofilepic.read_attribute(:image)
  end
  end
  def savephrasesandwords
    if recordmyphrasesandwords && recordmywords && recordmyphrasesandwords.length > 0 && recordmywords.length > 0 && recordmyphrasesandwords.length == recordmywords.length
      @i=0
      self.recordmyphrasesandwords.length.times do
      self.aidememoires.new do |x|
#        x.phrase=Phrase.find(self.myownphrasesandwords[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords[@i])
#        x.word = Word.find(self.myownwords[@i]) rescue Word.new(word: self.contentmyownwords[@i])
        paw=self.contentmyownphrasesandwords[@i].strip.squish
        w=self.contentmyownwords[@i].strip.squish
        x.recordedphrase=Recording.new(name: self.recordmywords[@i], content: (paw.length > 0 ? paw : x.phrase.content))
        x.recordedword=Recording.new(name: self.recordmyphrasesandwords[@i], content: (paw.length > 0 ? paw : x.word.content))
        
      end
      @i+=1
      end
      
    end
    
  end
  def self.ceuxdestvseries
    joins('left join tvserieshaveactors a on a.person_id = people.id').where('a.tvseries_id is not null')
    end
  def self.notfromtvseries(name =nil)
    joins('left join tvserieshaveactors a on a.person_id = people.id').where(['a.tvseries_id is null '+(name.length > 0 ? Array.new(name.length,' or people.name like ?').join(' ') : "")]+name.map{|x|"%#{x.gsub(' ','%')}%"})
    end
  def self.notfrommovies
    joins('left join phavefilms fi on fi.person_id = people.id').where('fi.film_id is null')
    end
  def self.pasceuxdestvseries
    joins('left join tvserieshaveactors a on a.person_id = people.id').where('a.tvseries_id is null')
    end
  def recordmyphrases=(x)
    x.each do |y|
      phrases.new(name: y)
    end
  end
  def recordmynames=(x)
    x.each do |y|
      mynames.new(name: y)
    end
  end
  def myownsurnames=(x)
    p "mynames"
    p x
    x.each_with_index do |rec,j|
      if rec.to_i > 0
        person=Person.find(rec)
        mynames.select {|x| !x.id}[j].content = person.name
      end
    end
  end
  def contentmyownsurnames=(x)
    p "content my names"
    p x
    x.each_with_index do |rec,j|
      surnameval=rec.squish.strip
      if surnameval.length > 0
        mynames.select {|x| !x.id}[j].content = surnameval
      end
    end

  end
  def myownphrases=(x)
    p "myphrases"
    p x
    x.each_with_index do |rec,j|
      if rec.to_i > 0
        phrase=Phrase.find(rec)
        phrases.select {|x| !x.id}[j].content = phrase.content
      end
    end
  end
  def contentmyownphrases=(x)
    p "content myphrases"
    p x
    x.each_with_index do |rec,j|
      phraseval=rec.squish.strip
      if phraseval.length > 0
        phrases.select {|x| !x.id}[j].content = phraseval
      end
    end

  end
  
  def fullname
    "#{firstnames} #{lastname}"
  end
  def self.chosephotofromalbum
    Person.joins(:album_photos).sample
  end
  def self.allthosepeoplewithcollections(id=nil)
    col=Person.joins(:collections).select(' people.*,collections.*, collections.name as colname, people.name as pplname, people.id as peopleid').group("people.id")
    if id
    col=Person.left_joins(:collections).select(' people.*,collections.*, collections.name as colname, people.name as pplname, people.id as peopleid').group("people.id")
      col=col.where("collections.id" => id)
    end
    
    col
  end
  def dernierspostschine
    Post.all.joins(:my_posts_surnames).where("posts_surnames.speaklike_id = ? or posts_surnames.person_id = ?",self.id,self.id).where('lower(posts.content_fr) like ? or lower(posts.content_en) like ? or lower(posts.content_de) like ? or lower(posts.content_fr) like ? or lower(posts.content_en) like ? or lower(posts.content_de) like ?','%chine%','%chine%','%chine%','%china%','%china%','%china%')
  end
  def myfacebookpage
    'https://www.facebook.com/'+facebook.split('/').last.split('=').last+'/friends'
  rescue
    nil
  end


  def self.afficherceuxla(chosen = nil,post = nil,mondestinataire=nil)
      @people = []
    if post && post.surnames[0]
      @str = post.surnames[0].name.strip.squish
      if @str.length > 0
        mystring=@str.downcase.gsub(' ','%')
      @people+=Person.where('lower(name) like ? or lower(description) like ?',"#{@str.downcase.gsub(' ','%')}%","#{mystring}%")
      end
      p @people
    end
    if mondestinataire
      @mystr = mondestinataire.strip.squish
      if @mystr.length > 0
        mystring=@mystr.downcase.gsub(' ','%')
      @people+=Person.where('lower(name) like ? or lower(description) like ?',"#{@mystr.downcase.gsub(' ','%')}%","#{mystring}%")
      end
      p @people
    end
    if post && post.my_posts_surnames[0] && post.myownsurnames[0] && post.myownsurnames[0].name



      @yourstr = post.myownsurnames[0].name.strip.squish
      if @yourstr.length > 0
        mystring=@yourstr.downcase.gsub(' ','%')
      @people+=Person.where('lower(name) like ? or lower(description) like ?',"#{mystring}%","#{mystring}%")
      end
      p @people
    end
    ok = ((@yourstr && @yourstr.length >= 3) ||(@str && @str.length >= 3) || (mondestinataire && mondestinataire.length >= 3) || (@mystr && @mystr.length >= 3))
    if chosen && chosen.length > 0 && ok
      (chosen.select {|x|x}+@people.to_a).uniq
    elsif @people && @people.length > 0 && ok
      (@people.to_a).uniq
    else
    #Person.all
      #(@people.to_a).uniq
      Person.where(id: [10])
    end
  end
  def self.moussaillons
    left_joins(:sailorjobs).select('people.*')
  end
  has_many :personaljingles, class_name: "Thisisjingle"
    #accepts_nested_attributes_for :personaljingles,  :allow_destroy => true
has_many :jingles, through: :personaljingles
  accepts_nested_attributes_for :jingles,  :allow_destroy => true

  #has_many :thisisjinglesinputs, through: :personaljingles, class_name: 'Jingle', source: :jingle
#
  def scheduledtasksoftheday
    d1=Date.today.at_beginning_of_day
    d2=Date.tomorrow.at_beginning_of_day
    self.scheduledtasks.where('date_and_time > ? and date_and_time < ?',d1,d2)
  end
def updatemyimage=(file)
      pathfile = "#{Rails.root.to_s}/app/assets/images/"+self.image
    filename =self.image
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
    #image =Post.cloud([loc,namefile].join('/'),pathfile)
    if image
    self.write_attribute(:image,image)
        self.permanentprofilepictures << Profilepicture.find_or_create_by(:image => image, :title => name)

    else
      
    self.permanentprofilepictures << Profilepicture.find_or_create_by(:image => namefile, :title => name)

  end

end
def updateimage=(file)
      pathfile = "#{Rails.root.to_s}/app/assets/images/"+self.image
    filename =self.image
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
    image =Post.cloud([loc,namefile].join('/'),pathfile)
    if image
    self.write_attribute(:image,image)
        self.permanentprofilepictures << Profilepicture.find_or_create_by(:image => image, :title => name)

    else
      
    self.permanentprofilepictures << Profilepicture.find_or_create_by(:image => namefile, :title => name)

  end

    save
end

def hasreactions
  self.reactions.count > 0
end
def self.withoutanycollection
joins(:collections).where(collections:[])
end
def imagepath
  read_attribute(:image)
end

 def defaultprofilepic
  image2=self.read_attribute(:image)
  if image2.to_s.include?('http')
    
  image2 || "imagedelutilisateurinconnu.png"
  else
  "/assets/#{image2}" || "imagedelutilisateurinconnu.png"
  end
 end
 def self.allmyprofilepics
   Person.where(id: select('people.id')).map do |person|
     Profilepicture.find_or_create_by(image: person.imagepath, title: person.name)
   end
   
 end
 def image

  image2=(self.profilepics.length > 0 ? (self.myprofilepic ? self.myprofilepic.image : nil) : nil ) rescue nil
  image2||=self.read_attribute(:image)
  if image2.to_s.include?('http')
    
  image2 || "imagedelutilisateurinconnu.png"
  elsif image2.to_s.include?('assets')
   image2
  else
  "/assets/#{image2}" || "imagedelutilisateurinconnu.png"
  end
end
 def facebook
   f=read_attribute(:facebook)
    f && f.length > 0 ? f : nil
 end
def image=(file)
  if file.is_a?(String)
          self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
      p pathfile
      name =file.original_filename
      ext = name.include?('.') ? name.split('.').last : ''
      filename = DateTime.now.to_s.gsub(/[^0-9]/, '')+'.'+ext
      self.write_attribute(:image,filename)
      loc='photos'
      abs="/app/assets/images/#{filename}"
      p abs
      #Post.cloud([loc,filename].join('/'),abs)
      `mv #{pathfile} #{Rails.root.to_s+abs}`


  end
#  if file
#    ppic = Profilepicture.find_or_create_by(title: self.name, image: self.read_attribute(:image))
#    self.permanentprofilepictures << ppic
#end

end
def month=(m)
  write_attribute(:month_met, m)
end
def year=(m)
  write_attribute(:year_met, m)
end

end
