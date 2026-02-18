class Olympicdistance < ApplicationRecord
has_many :olympicsplits
has_many :olympicdistances, through: :olympicsplits, source: :olympicdistance
has_many :olympicresults, through: :olympicsplits, source: :olympicresult
has_many :editionshaveevents, through: :olympicresults, source: :editionshaveevent
has_many :roundtypes, through: :olympicresults, source: :roundtype

end
