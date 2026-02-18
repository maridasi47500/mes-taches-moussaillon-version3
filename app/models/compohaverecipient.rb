class Compohaverecipient < ApplicationRecord
  belongs_to :musicalcomposition
  belongs_to :person
  belongs_to :surname
    accepts_nested_attributes_for :musicalcomposition
    accepts_nested_attributes_for :person
    accepts_nested_attributes_for :surname

end
