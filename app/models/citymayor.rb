class Citymayor < ApplicationRecord
belongs_to :city
belongs_to :user
belongs_to :person
end

