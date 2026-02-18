class User < ApplicationRecord
has_many :usersjobs
accepts_nested_attributes_for :usersjobs,allow_destroy: true
has_many :jobs,through: :usersjobs
has_many :mysectors,through: :usersjobs,source: :mysectors
belongs_to :city,optional:true
belongs_to :job,optional:true
has_many :userhavefamilies
has_many :familylinks, through: :userhavefamilies
has_many :userhavearmygrades
has_many :armygrades, through: :userhavearmygrades
has_many :userhaveskills
has_many :skills, through: :userhaveskills
has_many :userhavesongs
has_many :songs, through: :userhavesongs
has_many :userhaveclothes
has_many :clothes, through: :userhaveclothes
belongs_to :meuf, class_name: 'Recording', optional: true, autosave: true
belongs_to :mec, class_name: 'Recording', optional: true, autosave: true
attr_accessor :nbdoubles
before_validation :adddoubles
attr_accessor :mec1, :contentmec1
before_validation :monmec

def monmec
@i=0
    if self.contentmec1 && self.mec1 && self.mec1.length > 0

        phrase=Phrase.new(content: self.contentmec1) rescue Phrase.new

          w=""

          @rec1=Recording.new(name: self.mec1[@i], content: (w.length > 0 ? w : phrase.content))



self.mec = @rec1

end
end
attr_accessor :meuf1, :contentmeuf1
before_validation :mameuf

def mameuf
@i=0
    if self.contentmeuf1 && self.meuf1 && self.meuf1.length > 0

        phrase=Phrase.new(content: self.contentmeuf1) rescue Phrase.new

          w=""

          @rec1=Recording.new(name: self.meuf1[@i], content: (w.length > 0 ? w : phrase.content))



self.meuf = @rec1

end
end

def adddoubles
nbdoubles.to_i.times do
aliases.new
end
end
def latesttransaction
derniercompte=argent.last
date=derniercompte.created_at.to_date
transacs.where('date >= ?',date)
end
def latesttransactionsomme
latesttransaction.map {|x| x.somme}.sum
end
def self.findbyuser(users)
myid=users ? users.id : nil
if myid
findbyid(myid)
else
[]

end
end
def self.findbyid(i)
where(id: i)
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where(['lower(name) like ?']+Array.new(1,n1))
    else
    []
    end
  end

belongs_to :cook, foreign_key: 'cuisinier', optional: true, class_name: 'User'
belongs_to :sailor, foreign_key: 'ordures', optional: true, class_name: 'User'
has_one :client, foreign_key: 'cuisinier', class_name: 'User'
has_one :houseworkclient, foreign_key: 'ordures', class_name: 'User'
has_many :argent
has_many :transacs
has_many :usershavesectors
has_many :sectors, through: :usershavesectors
  has_many :savedpeople,  foreign_key: 'user_id'
  has_many :sauvegens, :source => "person",:through => :savedpeople, class_name: 'Person'

  has_many :liketask,  foreign_key: 'user_id'
  has_many :aimetaches, :source => "task",:through => :liketask, class_name: 'Task'
  has_many :dontliketask, foreign_key: 'user_id'
  has_many :aimepastaches, :source => "task", :through => :dontliketask,  class_name: 'Task'

  has_many :peoplelike,  foreign_key: 'user_id'
  has_many :aimegens, :source => "person",:through => :peoplelike, class_name: 'Person'
  has_many :peopledontlike, foreign_key: 'user_id'
  has_many :aimepasgens, :source => "person", :through => :peopledontlike,  class_name: 'Person'

  has_and_belongs_to_many :photos
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :jingles
#  belongs_to :double, class_name: 'Person', foreign_key: "person_id", optional: true
#  belongs_to :alias, class_name: 'Person', foreign_key: "person_id", optional: true
has_many :messages, class_name: 'Post', foreign_key: "user_id"
has_many :aliasesrecords, class_name: 'Alias'
has_many :mybookings, through: :aliasesrecords, source: :mybookings
has_many :aliases, class_name: 'Person', through: :aliasesrecords
accepts_nested_attributes_for :aliases, allow_destroy: true
has_many :profilepictures, through: :aliases
def self.photo
user = FbGraph2::User.new('352470235846385').authenticate('b64e6d2b273c060d39189b3ee52d6372')
user.fetch
p user.feed.as_json
end
def image
  image=self.read_attribute(:image).to_s
  if image.include?('http')
  image
  else
    "/assets/"+image
  end
end
def image=(file)
  if !file || file.is_a?(String)
        self.write_attribute(:image,file)

  else
      pathfile = file.tempfile.path
    filename =file.original_filename
    self.write_attribute(:image,filename)
    `mv #{pathfile} #{Rails.root.to_s+"/app/assets/images/#{filename}"}`
  end
      self.save

end
  def photos=(files)
  photos =[]
  files.each do |file|
      pathfile = file.tempfile.path
    filename =file.original_filename
      #filename =pathfile.split('/').last
      photos.push({name: filename})
    `mv #{pathfile} #{Rails.root.to_s+"/app/assets/photos/#{filename}"}`
  end
  self.save
  newphotos=self.photos.create!(photos) #valeur temporaire de user_id
  self.write_attribute(:image, newphotos.last.name)
  self.save
  #.add authors here
  #newphotos.each do |rec|
  # rec.authors << User.find(self.user_id) #le user_id est envoyé automatiquement normalement
  #end

end

end
