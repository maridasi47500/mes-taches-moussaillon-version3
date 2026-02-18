class Acquaintance < ApplicationRecord
    belongs_to :hackedperson, class_name: "Person", foreign_key: "person_id"

  belongs_to :post
end