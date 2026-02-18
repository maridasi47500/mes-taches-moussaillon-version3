class Additionaltask < ApplicationRecord
    belongs_to :maintask, class_name: "Task", foreign_key: "maintask_id"
  belongs_to :relatedtask, class_name: "Task", foreign_key: "othertask_id"
  belongs_to :event, class_name: "Event", foreign_key: "event_id", optional: true

end

