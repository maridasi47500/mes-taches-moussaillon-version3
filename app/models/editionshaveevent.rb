class Editionshaveevent < ApplicationRecord

belongs_to :olympicevent
has_one :sport_group, through: :olympicevent, source: :sport_group
belongs_to :edition
has_one :olympicgame, through: :edition, source: :olympicgame
def isarelay?
olympicevent.name.downcase.include?('relay')
end

has_many :rounds
has_many :roundtypes, {:through=>:rounds, :source=>"roundtype"}
has_many :olympicresults, through: :rounds, source: :olympicresults
has_many :nocs, through: :olympicresults, source: :noc
has_many :athletes, through: :olympicresults, source: :athlete
has_many :olympicdistances, through: :olympicresults
has_many :olympicsplits, through: :olympicdistances, source: :olympicsplits
      belongs_to :city
      belongs_to :country, optional: true
def noc
noc_id ? Country.find(noc_id) : nil
end
#def allroundssql
#Editionshaveevent.where(id: self.id).select("olympicresults.*, olympicresults.noc_id,olympicresults.lane,olympicresults.pos,olympicresults.heat,olympicdistances.name as olympicdistname,(select time(sum(strftime('YYYY-MM-DDTHH:MM:SS.sssZ',o.time)), 'unixlike') from olympicresults o where o.id <= olympicresults.id and o.round_id = olympicresults.round_id and o.pos = olympicresults.pos and o.lane = olympicresults.lane and o.noc_id = olympicresults.noc_id) as exchangepos, (select time(sum(strftime('YYYY-MM-DDTHH:MM:SS.sssZ',p.time)), 'unixlike') from olympicresults p where p.pos = olympicresults.pos and p.round_id = olympicresults.round_id and p.lane = olympicresults.lane and p.noc_id = olympicresults.noc_id) as mytime,olympicsplits.*, olympicdistances.*, rounds.roundtype_id, rounds.id as roundsid,countries.name_"+I18n.locale.to_s+" as noccountryname,olympicgames.name as editionname,cities.name_"+I18n.locale.to_s+" as cityname, countries.name_"+I18n.locale.to_s+" as countryname,people.name as athletename,countries.code as noccountrycode,roundtypes.name as roundtypename").left_joins(:city,:athletes,:rounds,:olympicgame,:olympicresults,:olympicdistances,:roundtypes,:nocs).references(:city,:athletes,:rounds,:olympicgame,:olympicresults,:olympicdistances,:roundtypes,:nocs)  #.order("roundtypes.name" => :desc)



#Editionshaveevent.where(id: self.id).select("olympicresults.*, olympicresults.noc_id,olympicresults.lane,olympicresults.pos,olympicresults.heat,olympicdistances.name as olympicdistname,(select time(sum(strftime('YYYY-MM-DDTHH:MM:SS.sssZ',o.time)), 'unixlike') from olympicresults o where o.id <= olympicresults.id and o.round_id = olympicresults.round_id and o.pos = olympicresults.pos and o.lane = olympicresults.lane and o.noc_id = olympicresults.noc_id) as exchangepos, (select time(sum(strftime('YYYY-MM-DDTHH:MM:SS.sssZ',p.time)), 'unixlike') from olympicresults p where p.pos = olympicresults.pos and p.round_id = olympicresults.round_id and p.lane = olympicresults.lane and p.noc_id = olympicresults.noc_id) as mytime,olympicsplits.*, olympicdistances.*, rounds.roundtype_id, rounds.id as roundsid,countries.name_"+I18n.locale.to_s+" as noccountryname,people.name as athletename,countries.code as noccountrycode,roundtypes.name as roundtypename, count(olympicdistances.id) as countsplit").left_joins(:athletes,:rounds,:olympicresults,:olympicdistances,:roundtypes,:nocs).references(:athletes,:rounds,:olympicresults,:olympicdistances,:roundtypes,:nocs)
#end
#def allrounds


#allroundssql.group_by {|h|h.roundtypename}
#end
def uniquedistance
olympicdistances.distinct.group(:name).sort_by{|y|y.name.gsub('m','').to_i}
end
def roundsbyrounds
rounds.group_by {|y|y.name}.to_a
end
def sexename
I18n.t('my.sexe.'+sexe)
end
def eventname
olympicevent.name
end
def sportname
olympicevent.sport.name
end
def eventmenu
[[eventname,sexename].join(', '), olympicevent.id]
end
def self.sexes
all.select('sexe').distinct.group('sexe').map{|y|[y.sexename,y.sexe]}
end
 
def self.allmyeditions
select('editionshaveevents.*,editionshaveevents.id as eventid, olympicevents.name as eventname, editionshaveevents.sexe as sexeathlete, sport_groups.name_'+I18n.locale.to_s+' as namegroup').joins(:sport_group).group("eventid,namegroup,sexeathlete,eventname").group_by{|x|x.sportname}.map{|y,z|[y,z.map(&:eventmenu)]}
end
end
