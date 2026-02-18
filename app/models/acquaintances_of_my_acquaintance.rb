class AcquaintancesOfMyAcquaintance < ApplicationRecord
  belongs_to :post
  belongs_to :usurpationrelatedpeople, class_name: "Person",  foreign_key: "person_id"
end
