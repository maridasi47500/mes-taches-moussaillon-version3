class Personrepas < ApplicationRecord
belongs_to :person
belongs_to :repas, optional: true
belongs_to :user
end
