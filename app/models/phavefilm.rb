class Phavefilm < ApplicationRecord
belongs_to :film
belongs_to :person
belongs_to :surname, optional: true
accepts_nested_attributes_for :surname
has_many :filmhavecouples
end
