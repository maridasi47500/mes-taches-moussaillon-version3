class Fakecouple < ApplicationRecord
belongs_to :someoneelse, class_name: "Twoperson"
belongs_to :otherperson, class_name: "Twoperson"
validates_uniqueness_of :someoneelse_id, scope: :otherperson_id

accepts_nested_attributes_for :someoneelse
accepts_nested_attributes_for :otherperson
after_initialize do
self.otherperson||=Twoperson.new
self.someoneelse||=Twoperson.new
end

def name
self.otherperson.try(:person).try(:name).to_s+" "+self.self.otherperson.try(:otherperson).try(:name).to_s+" "+self.someoneelse.try(:person).try(:name).to_s+" "+self.someoneelse.try(:otherperson).try(:name).to_s+" "

end
end
