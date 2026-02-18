class Additionalevent < ApplicationRecord
  belongs_to :mainevent, class_name: "Event", foreign_key: "mainevent_id"
  belongs_to :relatedevent, class_name: "Event", foreign_key: "otherevent_id"
end
