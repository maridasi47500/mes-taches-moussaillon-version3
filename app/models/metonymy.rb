class Metonymy < ApplicationRecord
  belongs_to :metonymy, optional: true
  has_one :untruemetonymy, class_name:'Metonymy', foreign_key:'metonymy_id'
  belongs_to :thing, optional: true
  belongs_to :post, optional: true
  accepts_nested_attributes_for :metonymy
  def linkto
    self.metonymy || self.post
  end
end
