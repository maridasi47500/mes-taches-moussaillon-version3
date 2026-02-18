class Roundtype < ApplicationRecord
has_many :rounds
has_many :editionshaveevents, through: :rounds
def roundsid(g)
rounds.roundsid(g)
end
end
