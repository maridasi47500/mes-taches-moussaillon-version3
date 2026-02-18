class Anaphor < ApplicationRecord
  has_and_belongs_to_many :tasks
  accepts_nested_attributes_for :tasks
  has_and_belongs_to_many :nicephotos, class_name:"Photo"
  accepts_nested_attributes_for :nicephotos
  has_and_belongs_to_many :sailors, class_name: 'Person'
  accepts_nested_attributes_for :sailors

  translates :description
  belongs_to :epoch
end

