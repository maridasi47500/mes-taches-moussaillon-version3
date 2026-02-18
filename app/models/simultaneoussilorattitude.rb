class Simultaneoussilorattitude < ApplicationRecord
belongs_to :attitudeshavesailora, class_name: 'Attitudeshavesailor'
belongs_to :attitudeshavesailorb, class_name: 'Attitudeshavesailor'
validates_uniqueness_of :attitudeshavesailora_id, scope: :attitudeshavesailorb_id

end
