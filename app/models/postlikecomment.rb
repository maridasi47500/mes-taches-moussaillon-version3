class Postlikecomment < ApplicationRecord
  belongs_to :thing, optional: true, class_name: "Thing", foreign_key: "score_id"
  #belongs_to :musicalinstrument
  
  belongs_to :attitude, optional: true
    accepts_nested_attributes_for :attitude, allow_destroy: true

  belongs_to :post, optional: true
      accepts_nested_attributes_for :post, allow_destroy: true

  belongs_to :setoftask, optional: true
      accepts_nested_attributes_for :setoftask, allow_destroy: true

  belongs_to :sailor, optional: true, class_name: "Person"
      accepts_nested_attributes_for :sailor, allow_destroy: true

  belongs_to :task, optional: true
  
        accepts_nested_attributes_for :task, allow_destroy: true

end
