class SportGroup < ApplicationRecord
has_many :olympicevents
translates :name
end