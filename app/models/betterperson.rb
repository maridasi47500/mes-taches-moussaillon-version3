class Betterperson < ApplicationRecord
after_initialize :myfunction

def person_id
person ? person.id : nil
end
def otherperson_id
otherperson ? otherperson.id : nil
end
belongs_to :twoperson
has_one :person, through: :twoperson, source: :person
has_one :otherperson, through: :twoperson, source: :otherperson, class_name: 'Person'
validates_uniqueness_of :twoperson_id, scope: [:attitude_id, :user_id]
belongs_to :attitude
belongs_to :user
has_many :findthemost
has_many :findthemostlgbts
accepts_nested_attributes_for :twoperson

def myfunction
self.twoperson ||= Twoperson.new

end

end
