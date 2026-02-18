class Tickethavehiddenmessage < ApplicationRecord
  belongs_to :message, class_name: "Messagecache", foreign_key: "hiddenmessage_id"
    belongs_to :ticket
  
end
