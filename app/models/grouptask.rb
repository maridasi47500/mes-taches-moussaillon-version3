class Grouptask < ApplicationRecord
  belongs_to :task
  translates :title
  has_many :sailorgrouptasks
  accepts_nested_attributes_for :sailorgrouptasks
  has_many :people, through: :sailorgrouptasks

end
