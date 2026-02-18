class Someonemusicalinstrument < ApplicationRecord
belongs_to :musicalinstrumentshaveplayer
belongs_to :city
validates_uniqueness_of :musicalinstrumentshaveplayer_id,scope: :city_id
end 
