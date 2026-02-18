class Episodehaveactor < ApplicationRecord
belongs_to :episode
belongs_to :tvserieshaveactor
has_one :tvseries, through: :tvserieshaveactor
has_one :surname, through: :tvserieshaveactor
has_one :person, through: :tvserieshaveactor, source: :actor
validates_uniqueness_of :episode_id, scope: [:tvserieshaveactor_id]

end