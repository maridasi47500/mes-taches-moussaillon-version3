class Simultaneousprosailorattitude < Applicationrecord
 belongs_to :attitudeshavesailora, class_name: 'Attitudeshavesailor'
 belongs_to :attitudehavefollowerb, class_name: 'Attitudehavefollower'
validates_uniqueness_of :attitudeshavesailora_id, scope: :attitudehavefollowerb_id

end
