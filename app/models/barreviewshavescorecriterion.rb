class Barreviewshavescorecriterion < ApplicationRecord
belongs_to :barreview
belongs_to :scorecriterion, foreign_key: "scorecriteria_id"
end

