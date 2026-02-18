class Mymapscoord < ApplicationRecord
belongs_to :mymap
belongs_to :place, optional: true
end
