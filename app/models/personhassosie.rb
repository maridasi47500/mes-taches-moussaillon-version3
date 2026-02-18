class Personhassosie < ApplicationRecord
belongs_to :person
belongs_to :sosie, class_name: 'Person'

end
