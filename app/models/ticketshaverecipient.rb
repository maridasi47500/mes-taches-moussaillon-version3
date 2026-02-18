class Ticketshaverecipient < ApplicationRecord
  belongs_to :recipient, class_name: "Person"
  belongs_to :ticket
end
