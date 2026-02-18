class Episode < ApplicationRecord
belongs_to :tvseries
has_many :episodehaveactors
has_many :tvserieshaveactors, through: :episodehaveactors
validates_uniqueness_of :tvseries_id, scope: [:saison, :ep]
has_many :surnames, through: :tvserieshaveactors, source: :surname


end