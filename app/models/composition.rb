class Musicalcomposition < ApplicationRecord
  has_many :couplethavecomposedcontents
  has_many :couplets, through: :couplethavecomposedcontents
  has_many :refrainhavecomposedcontents
  has_many :refrains, through: :refrainhavecomposedcontents

end
