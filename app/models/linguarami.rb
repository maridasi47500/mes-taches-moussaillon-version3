class Linguarami < ApplicationRecord
belongs_to :user
has_many :linguaramishavephrases
has_many :phrases, through: :linguaramishavephrases
end
