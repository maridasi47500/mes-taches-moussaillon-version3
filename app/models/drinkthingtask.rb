class Drinkthingtask < ApplicationRecord
belongs_to :drink
belongs_to :task
belongs_to :person, optional: true
belongs_to :user
validates_presence_of :qty
end
