class Olympicresult < ApplicationRecord
attr_accessor :"ExchangePos", :"m550m", :"m450m", :"m350m",  :"m250m", :"m50m", :Pos, :Lane, :Swimmer, :"NOC", :"R1", :"SF", :"Final", :"m100m", :"m200m", :"m300m", :"m400m", :"m500m", :"m600m", :"m700m", :"Reaction", :"Time",:"m150m", :"m800m",:"m900m",:"m1000m",:"m1100m",:"m1200m",:"m1300m",:"m1400m",:"m1500m"

has_many :olympicsplits
has_many :olympicdistances, through: :olympicsplits
belongs_to :round
has_one :medal, class_name: "Olympicmedal", autosave: true

has_one :roundtype, through: :round, source: :roundtype
has_one :editionshaveevent, through: :round
belongs_to :athlete, class_name: "Person"
belongs_to :noc, class_name: "Country"
attr_accessor :Medal, :Medals



def mymedals
allmedals=self.send('Medals')
if allmedals && if allmedals.length > 0 && roundtype.name == "Final"

if allmedals[0] == self.Swimmer || allmedals[0] == noc.name
self.build_medal(color: 'or')

elsif allmedals[1] == self.Swimmer || allmedals[1] == noc.name
self.build_medal(color: 'ar')

elsif allmedals[2] == self.Swimmer || allmedals[2] == noc.name
self.build_medal(color: 'br')
end
end
end
end


def self.addmedalrelay(resultids, orvalue, ar,br)
Olympicresult.where(id: resultids).each do |t|
t.medal.destroy if t.medal
if orvalue
t.medal = Olympicmedal.create(color: "or")
elsif ar
t.medal = Olympicmedal.create(color: "ar")
elsif br
t.medal = Olympicmedal.create(color: "br")

end
t.save
end
end

def self.addmedal(resultid, orvalue, ar,br)
t=Olympicresult.find(resultid)
t.medal.destroy if t.medal
if orvalue
t.medal = Olympicmedal.create(color: "or")
elsif ar
t.medal = Olympicmedal.create(color: "ar")
elsif br
t.medal = Olympicmedal.create(color: "br")

end
t.save
end
def uniquedistance
olympicdistances.distinct
end
def noccountryname
noc.name
end
def myolympicsplits
olympicsplits.order(time: :asc).where.not(time: nil)
end
def noccountrycode
noc.code
end
def self.olres(rid,e)
joins(:editionshaveevent,:roundtype).references(:editionshaveevent,:roundtype).where("editionshaveevents.id" => e, "roundtypes.id" => rid)
end
def self.oldist(rid,e)
[]
#counter avec un join et retourner le slice d'une array des distances [1Om, 10m, 30m]
#Olympicdistance.joins(:editionshaveevents,:roundtypes).references(:editionshaveevents,:roundtypes).order('mydistance').select("olympicdistances.name as distancelength, cast(replace(olympicdistances.name,'m','') as integer)  as mydistance").group('olympicdistances.id').having(["roundtypes.id = ? and editionshaveevents.id = ?",rid,e])
end

def time=(x)
p x
if x == "-" || x == "–"
write_attribute(:time, nil)
elsif x
p "time"
t1=x.to_s.split(' ')[0]+"0"
t1=t1.include?(':') ? t1 : "00:"+t1
t=DateTime.strptime(t1, '%M:%S.%L') rescue nil
write_attribute(:time, t)
end
end

def time
read_attribute(:time)
end


def myresult
p = Person.find_or_initialize_by(name: self.Swimmer) rescue nil
if p
p.image= "olympicflag.png"
p p
p.femme = true if self.editionshaveevent.sexe.include? "Women"
p.homme = true if self.editionshaveevent.sexe.include? "Men"
self.pos = self.Pos
self.athlete = p
p self
#y.heat = roundnb.strip.squish.split(' ').last.gsub(')','')
self.time = self.Time
self.lane = self.Lane
p self
self.noc = Country.find_by(code: self.NOC) if self.NOC.to_s.length == 3
self.reaction = self.Reaction
distance=["m450m","m350m","m50m","m250m","m100m", "m200m", "m300m", "m400m", "m500m", "m600m", "m700m","m150m", "m800m","m900m","m1000m","m1100m","m1200m","m1300m","m1400m","m1500m"]
distance.each do |d|
self.olympicsplits.new(olympicdistance: Olympicdistance.find_or_create_by(name: d), time: self.send(d))
end
p self.NOC, "(NOC)"
end
end
def self.mydistances
["m450m","m350m","m50m","m250m","m100m", "m200m", "m300m", "m400m", "m500m", "m600m", "m700m","m150m", "m800m","m900m","m1000m","m1100m","m1200m","m1300m","m1400m","m1500m"]
end
      #t.integer :round_id
      #t.integer :athlete_id
      #t.integer :heat
      #t.integer :lane
      #t.integer :pos
      #t.time :time
      #t.float :reaction
      #t.boolean :qualified

before_validation :myresult
after_validation :mymedals
end
