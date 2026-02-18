class Factoriesservicehaveemployee < ApplicationRecord
belongs_to :factoryservice
belongs_to :person
validates_uniqueness_of :factoryservice_id, scope: :person_id
def name
I18n.t('display.emptravailleau', person: self.person.name, factoryservice: self.factoryservice.name)
end
def self.findbyid(i)
where(id: i)
end
def self.findbyname(i)
k="%"+i.downcase.gsub('%',' ')+"%"
joins(:factoryservice,:person).select("things.*, people.*,factoriesservicehaveemployees.*").where(["lower(things.name_fr) like ? or lower(things.name_en) like ? or lower(things.name_de) like ? or lower(people.name) like ?",k,k,k,k])
end
end
