class Salutmilitaire < ApplicationRecord
belongs_to :laundryjiramaperson
has_one :persona,through: :laundryjiramaperson,source: :person
belongs_to :otherlaundryjiramaperson, class_name: 'Laundryjiramaperson'
has_one :personb,through: :otherlaundryjiramaperson,source: :person

validates_uniqueness_of :laundryjiramaperson_id, scope: :otherlaundryjiramaperson_id
def self.inverse(i)
g=find(i)
l1=g.laundryjiramaperson 
l2=g.otherlaundryjiramaperson 
g.laundryjiramaperson =l2
g.otherlaundryjiramaperson =l1
g.save
g
end
has_and_belongs_to_many :tickets, :join_table => :salutmilitairehavetickets
accepts_nested_attributes_for :tickets

end
