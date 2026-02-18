class Ticket < ApplicationRecord
def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(content_en) like ? or lower(content_fr) like ? or lower(content_de) like ?",o,o,o])
end

translates :content
has_many :worktwoshavetickets
has_many :worktwos, through: :worktwoshavetickets
has_many :linkfamilyhavetickets
has_many :linkfamilypeople, through: :linkfamilyhavetickets
has_many :linkspousehavetickets
has_many :linkspousepeople, through: :linkspousehavetickets
  belongs_to :message, foreign_key: "message_id", class_name: 'MessageForTicket', optional: true
  accepts_nested_attributes_for :message, allow_destroy: true
  has_many :ticketsaboutpeople
  has_many :aboutpeople, :through => :ticketsaboutpeople, class_name: "Person"
  has_many :ticketshavesenders
  has_many :senders, :through => :ticketshavesenders, class_name: "Person"
  has_many :ticketshaverecipients
  has_many :recipients, :through => :ticketshaverecipients, class_name: "Person"
  has_and_belongs_to_many :successfultasks, class_name: "Task", :join_table => :tasksvalidatetickets
  has_and_belongs_to_many :failingtasks, class_name: "Task", :join_table => :tasksunvalidatetickets
  has_many :tickethavehiddenmessages
  has_many :messages, class_name: "Messagecache", :through => :tickethavehiddenmessages, source: :message
  accepts_nested_attributes_for :messages, allow_destroy: true
  def amazone?
	amazonefemme? || amazonehomme?
  end
  def amazonefemme?
        samsexe='F'
	send=senders.all? {|x|x.sexe == samsexe} 
	rec=recipients.all? {|x|x.sexe == samsexe}
	about=aboutpeople.all? {|x|x.sexe == samsexe}
	send && rec && about
  end
  def amazonehomme?
        samsexe='M'
	send=senders.all? {|x|x.sexe == samsexe} 
	rec=recipients.all? {|x|x.sexe == samsexe}
	about=aboutpeople.all? {|x|x.sexe == samsexe}
	send && rec && about
  end
  def self.standardtickets
    where(canceltask: nil)
  end
  def standardticket
    canceltask == nil
  end
end
