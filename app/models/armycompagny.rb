class Armycompagny < ApplicationRecord
has_many :personarmycompagnies
has_many :people, through: :personarmycompagnies
end
