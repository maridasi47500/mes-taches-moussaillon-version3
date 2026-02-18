class Country < ApplicationRecord
has_many :olympicresults, foreign_key: 'noc_id', class_name: 'Olympicresult'
has_many :rounds, through: :olympicresults, source: :round
has_many :medals, through: :olympicresults, source: :medal
has_many :editionshaveevents, through: :olympicresults, source: :editionshaveevent
has_many :olympicevents, through: :editionshaveevents, source: :olympicevent
has_many :sport_groups, through: :olympicevents, source: :sport_group
has_many :editions, through: :editionshaveevents, source: :edition
has_many :olympicgames, through: :editions, source: :olympicgame
has_many :athletes, through: :olympicresults, source: :athlete
translates :name
def self.bycountry
group('countries.id')
end
def self.mymedalsbycountry
medalsbycountry.bycountry.limit(10).parcouleurmedaille('cl')
end
def self.medalsbycountry
joins(:medals).references(:medals).select("countries.name_"+I18n.locale.to_s+" as countryname, countries.code as countrycode, cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'br') as float) as bronzevalue, cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'ar') as float) * 2.3 as silvervalue, cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'or') as float) * 6.3 as goldvalue, (cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'br') as float)+ cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'ar') as float) * 2.4 +cast((select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'or') as float) *6.3 ) as totalvalue, (select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'br') as bronze, (select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'ar') as silver, (select count(distinct olympicmedals.id) from olympicmedals left join olympicresults o on olympicmedals.olympicresult_id = o.id where o.noc_id = countries.id and olympicmedals.color = 'or') as gold,count(distinct olympicmedals.id) as total")
end
def self.searchathlete(sport_id, sport_group_id,edition_id, competition_type_id, season_id, athlete_gender, gender, event_name_id, sort)
pardiscipline(sport_id).parsport(sport_group_id).paredition(edition_id).parcompetition(competition_type_id).parsaison(season_id).parcouleurmedaille(sort).parevenement(event_name_id).pargenre(gender).pargenredathlete(athlete_gender).joins('left join olympicresults on olympicresults.noc_id = countries.id').joins('left join olympicmedals on olympicmedals.olympicresult_id = olympicresults.id').joins('left join people on people.id = olympicresults.athlete_id').joins('left join olympicmedals on olympicmedals.olympicresult_id = olympicresults.id').joins('left join rounds on olympicresults.round_id = rounds.id').joins('left join editionshaveevents on editionshaveevents.id = rounds.editionshaveevent_id').joins('left join olympicevents on olympicevents.id = editionshaveevents.olympicevent_id').joins('left join olympicsports on olympicsports.id = olympicevents.olympicsport_id').joins('left join sport_groups on sport_groups.id = olympicsports.sport_group_id').joins('left join editions on editionshaveevents.edition_id = editions.id').joins('left join olympicgames on olympicgames.id = editions.olympicgame_id').select('olympicmedals.*,people.*,olympicevents.*,sport_groups.*,editions.*,olympicgames.*,editionshaveevents.*,countries.id as countriesid, olympicresults.*').medalsbycountry.bycountry


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
select('*').order('gold' => :desc)
when 'ar'
select('*').order('silver' => :desc)
when 'br'
select('*').order('bronze' => :desc)
when 'to'
select('*').order('total' => :desc)
when 'va'
select('*').order('goldvalue' => :desc,'silvervalue' => :desc, 'bronzevalue' => :desc)
when 'cl'
select('*').order('gold' => :desc,'silver' => :desc, 'bronze' => :desc)
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
def self.allolympic
joins(:olympicresults).select('countries.*, countries.id as countryid').group('countryid').order(code: :asc)
end
def self.withicons
where.not(mapicon:nil).sample(4)
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    where(['lower(name_fr) like ? or lower(name_en) like ? or lower(name_de) like ?']+Array.new(3,n1))
    else
    []
    end
  end
  def self.findbyid(i)
    where(id: i)
  end

    def mapicon=(file)
      if !file.is_a?(String)
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      if filename.length > 0
      self.write_attribute(:mapicon, filename)
      end
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
      `mv #{pathfile} #{abs}`
      #Post.cloud([loc,filename].join('/'),abs)
      else
      self.write_attribute(:mapicon, file)

       end

    end

end
