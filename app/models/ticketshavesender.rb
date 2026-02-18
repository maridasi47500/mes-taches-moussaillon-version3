class Ticketshavesender < ApplicationRecord
  belongs_to :sender, class_name: "Person"

   belongs_to :ticket

end
