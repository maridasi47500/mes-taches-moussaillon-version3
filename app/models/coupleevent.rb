class Coupleevent < ApplicationRecord
translates :content
belongs_to :linkspouseperson
belongs_to :user
validates_presence_of :date
end
