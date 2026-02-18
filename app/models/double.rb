class Double < ApplicationRecord
  belongs_to :post
  belongs_to :usurpation, class_name: 'Person', foreign_key: 'person_id'
  belongs_to :sondouble, class_name: 'Double', foreign_key: 'double_id', optional: true
  validates_uniqueness_of :post_id, scope: :person_id 
end
