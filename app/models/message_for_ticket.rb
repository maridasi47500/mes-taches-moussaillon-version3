class MessageForTicket < ApplicationRecord
  has_many :tickets, foreign_key: "message_id", class_name: "Ticket"
  translates :content
end
