class Attitude < ApplicationRecord
translates :name

has_and_belongs_to_many :tasks, :join_table => :taskshaveattitudes
has_and_belongs_to_many :peoplebuytraveltickets, :join_table => :attitudeshavepeoplebuytraveltickets
has_and_belongs_to_many :peoplebuyclothes, :join_table => :attitudeshavepeoplebuyclothes

before_validation :createdme, on: :create
def createdme
self.created_at=DateTime.now
end
before_validation :updateme, on: :update
def updateme
self.updated_at=DateTime.now
end
def self.todays
where("created_at > ?", DateTime.now.beginning_of_day)
end

def self.tasksameattitude
joins('left join taskshaveattitudes att on att.attitude_id = attitudes.id').joins('left join tasks mytasks on att.task_id = mytasks.id').select('att.*, attitudes.*,mytasks.*,mytasks.name_'+I18n.locale.to_s+' as taskname,mytasks.id as taskid, attitudes.name_'+I18n.locale.to_s+' as attitudename').joins('left join thistasknotthistasks h on h.task_id = mytasks.id or h.othertask_id = mytasks.id').select('h.*').where('h.id is not null')
end

attr_accessor :search
after_initialize :searchmyattitude
has_many :attitudeshavesailors
has_many :sailors, :through => :attitudeshavesailors, class_name: 'Person', source: :person
has_many :attitudehavefollowers
has_many :amateurs, through: :attitudehavefollowers, source: :person
  belongs_to :attitude, optional: true
    has_one :badattitude, class_name:'Attitude', foreign_key:'attitude_id'
  belongs_to :thing, optional: true
  validates :name, presence: {message: "What attitude did you have ?"}
  belongs_to :post, optional: true
  accepts_nested_attributes_for :attitude
  has_many :postlikecomments
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    joins('left join attitudeshavesailors ab on ab.attitude_id = attitudes.id').joins('left join people b on ab.person_id = b.id').joins('left join attitudehavefollowers aa on aa.attitude_id = attitudes.id').joins('left join people a on aa.person_id = a.id').select('aa.*,ab.*,a.name as aname,b.name as bname,attitudes.*').where(['lower(attitudes.name_fr) like ? or lower(attitudes.name_en) like ? or lower(attitudes.name_de) like ? or lower(bname) like ? or lower(aname) like ?',n1,n1,n1,n1,n1]).group('attitudes.id')
    else
    []
    end
  end

  def linkto
    self.attitude || self.post
  end
	def self.findbyid(o)
	        where("id"=>o)
	end
def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
end
def self.findbyid(i)
where(id: i)
end
def searchmyattitude
if self.search
if Attitude.findbyname(self.search).length == 0
    self.errors.add(:base, I18n.t("attitude.search", q: self.search))

end
end
end




end
