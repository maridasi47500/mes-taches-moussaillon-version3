class Companieshaveceo < ApplicationRecord
belongs_to :ceo, class_name: 'Person'
belongs_to :job
belongs_to :company

belongs_to :user
belongs_to :nationality
end
