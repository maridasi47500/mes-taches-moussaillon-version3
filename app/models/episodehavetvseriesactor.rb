class Episodehavetvseriesactor < ApplicationRecord
belongs_to :episode, class: "Parodyepisode"
belongs_to :tvseriesparodiehaveactor
validates_uniqueness_of :episode_id, scope: :tvseriesparodiehaveactor_id
end