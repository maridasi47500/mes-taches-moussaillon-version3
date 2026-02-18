class Scheduledtask < ApplicationRecord
  has_and_belongs_to_many :validations,  :join_table => :mytablenames
  accepts_nested_attributes_for :validations #,  :allow_destroy => true
  has_and_belongs_to_many :people, :join_table => :peopleschedules
  accepts_nested_attributes_for :people,  :allow_destroy => true
end
