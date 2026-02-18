class Taskshaveaccomplishment < ApplicationRecord
  belongs_to :sailor, class_name: "Person"
  belongs_to :task, class_name: "Task"
  belongs_to :ticket, class_name: "Ticket", optional: true
  accepts_nested_attributes_for :ticket
  attr_accessor :validatetickets,:unvalidatetickets
  before_validation :validatemytickets, :on => [:create,:update]
  def validatemytickets
    p self.validatetickets, "validate tickets"
    if self.validatetickets == true
      copyid=self.task.validatingtickets.standardtickets.where(validated: nil).pluck(:id)
      copyticket=Ticket.where(id: copyid)
      copyticket.update_all(validated: true)
      copyticket.each do |x|
        if x.thereissender && x.senders.length == 0 && !(x.recipients.length == 0)
          x.senders << [sailor]
        end
        if x.thereisrecipient && x.recipients.length == 0 && !(x.senders.length == 0)
          x.recipients << [sailor]
        end
      end
      @post=Post.new(content_en: "", content_fr: "",tickets: copyticket)
      @post.save
    end
    if self.unvalidatetickets == true
      self.task.unvalidatingtickets.standardtickets.where(validated: nil).update_all(validated: false)
      @post=Post.new(content_en: "", content_fr: "",tickets: copyticket)
      @post.save

    end
  end

end
