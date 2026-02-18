class Sector < ApplicationRecord
has_many :sectorshavebacseries
has_many :bacseries, through: :sectorshavebacseries
has_many :sectorshaveadmissionfiles
has_many :admissionfiles, through: :sectorshaveadmissionfiles
has_many :sectorshavecities
has_many :cities, through: :sectorshavecities
belongs_to :field
def mysectors
Sector.where(field_id: self.field_id)
end
def self.findbyname(name)
cityn='%'+name.gsub(' ','%')+'%'
where("lower(name) like ?",cityn) + joins(:cities).where('cities.name_en like ? or cities.name_fr like ? or cities.name_de like ?',cityn,cityn,cityn).select('cities.*, cities.name_de as citynamede, cities.name_fr as citynamefr, cities.name_en as citynameen, sectors.*') + joins(:field).where(['lower(fields.name) like ?',cityn]).select('fields.*, fields.name as fieldname,sectors.*') + joins(:field).where(['lower(fields.name) like ?',cityn]).select('fields.*, fields.name as fieldname,sectors.*') + joins(:bacseries).where('bacseries.name like ?',cityn).select('bacseries.*, bacseries.name as fieldname,sectors.*')

rescue => e
p e.message
end
def self.findbycriterion(city,field,seriebac,field2)
if city
cityn='%'+city.gsub(' ','%')+'%'
joins(:cities).where('cities.name_en like ? or cities.name_fr like ? or cities.name_de like ?',cityn,cityn,cityn).select('cities.*, cities.name_de as citynamede, cities.name_fr as citynamefr, cities.name_en as citynameen, sectors.*')
elsif field2
joins(:field).where(['lower(fields.name) like ?','%'+field2.gsub(' ','%').downcase+'%']).select('fields.*, fields.name as fieldname,sectors.*')
elsif field
joins(:field).where(['lower(fields.name) like ?','%'+field.gsub(' ','%').downcase+'%']).select('fields.*, fields.name as fieldname,sectors.*')
elsif seriebac
joins(:bacseries).where('bacseries.name like ?','%'+seriebac.gsub(' ','%').downcase+'%').select('bacseries.*, bacseries.name as fieldname,sectors.*')

end
rescue => e
p e.message
end

end
