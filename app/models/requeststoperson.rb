class Requeststoperson < ApplicationRecord
has_and_belongs_to_many :personhavelifestates, :join_table => :lifestateshaverequests
has_many :lifestates, :through => :personhavelifestates
has_many :somepeople, :through => :personhavelifestates, source: :person
has_many :requeststopersonhaverequestpeople
has_many :requestpeople, through: :requeststopersonhaverequestpeople, autosave: true
attr_accessor :myrequestpeople_attributes
  accepts_nested_attributes_for :requestpeople, allow_destroy: true
  def myrequests
    # Find or create the author by name

  end
def autosave_associated_records_for_requestpeople

end

  #def autosave_associated_records_for_requestpeople
  #  # Find or create the author by name
  #  ne_p=myrequestpeople_attributes
  #  new_p=Requestperson.new(ne_p)
  #  if !requestpeople.find_by(ne_p)
  #    self.requestpeople.new(ne_p)
  #    #self.save
  #  end
  #end



belongs_to :alias,optional: true
belongs_to :requestperson
accepts_nested_attributes_for :requestperson
translates :content
before_validation :req
def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(content_en) like ? or lower(content_fr) like ? or lower(content_de) like ?",o,o,o])
end

def req
    ne_p=myrequestpeople_attributes
        if ne_p
        #    if !Requestperson.find_by(ne_p)
        #
        #
        #      self.requestpeople.new(ne_p)
        # elsif !self.requestpeople.find_by(ne_p)
      g=self.requestpeople.find_or_initialize_by(ne_p)
  existing_comments = []
  new_comments = []
  p "requestpeople", requestpeople

  requestpeople.each do |comment|
    p "comment", comment
    if existing_comment = Requestperson.find_by_persona_id_and_personb_id(comment.persona_id, comment.personb_id)
      existing_comments << existing_comment
    elsif new_com = comment.save
      new_comments << new_com
    end
  end

  p new_comments, existing_comments
  self.requestpeople.clear
  self.requestpeople << new_comments + existing_comments
  end
j=self.requestperson
if j && j.persona && j.personb
l=Requestperson.find_by(persona: j.persona, personb: j.personb)
if l
self.requestperson=l
end
end
end
end
