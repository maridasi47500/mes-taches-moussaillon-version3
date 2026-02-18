class Modedetransport < ApplicationRecord
  belongs_to :place
  belongs_to :means_of_transport
end
