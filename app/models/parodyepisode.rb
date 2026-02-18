class Parodyepisode < AppliationRecord
belongs_to :tvseriesparody
validates_uniqueness_of :tvseriesparody_id, scope: [:saison, :ep]
has_many :episodehavetvseriesactors
has_many :tvseriesparodiehaveactors, through: :episodehavetvseriesactors, source: :episode
end