class Barreviewshavebarcriterion < ApplicationRecord
belongs_to :barreview
belongs_to :barcriterion, foreign_key: "barcriteria_id"
end
