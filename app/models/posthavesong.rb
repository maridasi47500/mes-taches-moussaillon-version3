class Posthavesong < ApplicationRecord
belongs_to :post
belongs_to :song
validates_uniqueness_of :post_id, scope: :song_id
end
