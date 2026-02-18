class Olympicevent < ApplicationRecord
has_many :editionshaveevents

belongs_to :olympicsport
has_one :sport_group, through: :olympicsport
has_one :sport, through: :olympicsport, source: :sport

end
