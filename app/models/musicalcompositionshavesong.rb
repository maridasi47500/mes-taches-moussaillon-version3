class Musicalcompositionshavesong < ApplicationRecord
belongs_to :musicalcomposition
belongs_to :song
validates_uniqueness_of :musicalcomposition_id, scope: :song_id
end
