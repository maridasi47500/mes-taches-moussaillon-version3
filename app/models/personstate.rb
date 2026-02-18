class Personstate < ApplicationRecord
translates :state
has_many :remedieshavefoods
has_many :foods, through: :remedieshavefoods
has_many :remedieshavedrinks
has_many :drinks, through: :remedieshavedrinks

end
