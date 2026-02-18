class Profilepicsforpeople < ApplicationRecord
  belongs_to :person
  belongs_to :profilepicture
end
