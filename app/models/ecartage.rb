class Ecartage < ApplicationRecord
belongs_to :person, class_name: "Person"
belongs_to :otherperson, class_name: "Person", foreign_key: "otherperson_id"

end
