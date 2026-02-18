class Barreview < ApplicationRecord
belongs_to :user, class_name: 'User'
belongs_to :barattempt
has_many :barreviewshavescorecriteria
has_many :scorecriteria, through: :barreviewshavescorecriteria
has_many :barreviewshavebarcriteria
has_many :barcriteria, through: :barreviewshavebarcriteria
end
