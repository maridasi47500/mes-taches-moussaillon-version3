class Task < ApplicationRecord
has_many :taskhavetypes
has_many :tasktypes, through: :taskhavetypes
attr_accessor :length_a, :length_b
has_many :grouptasks
accepts_nested_attributes_for :grouptasks
before_validation :lengthtime
def lengthtime
if length_a || length_b
time = length_a.to_i.hours + length_b.to_i.minutes
self.end_at = self.start_at + time
end
end
has_many :optiontasks
has_many :followingtasks, through: :optiontasks, source: :followingtask
has_many :taskshavefilms
has_many :films, through: :taskshavefilms
has_many :taskshavetvseries
has_many :tvseries, through: :taskshavetvseries
  has_many :starattitudes
  accepts_nested_attributes_for :starattitudes, allow_destroy: true
  has_many :grouptasks
  accepts_nested_attributes_for :grouptasks, allow_destroy: true
has_and_belongs_to_many :songs, :join_table => :taskshavesongs

has_many :places_tasks
has_many :places, through: :places_tasks
has_many :google_requests_tasks
has_many :google_requests, through: :google_requests_tasks
def tachesuivante
y=Task.all.ids
y.index(self.id)
Task.find((y+1))
end

   def image
  image=self.read_attribute(:image)

  image && image.include?('http:') ? image : "/assets/#{image}"
end
def image=(file)
      pathfile = file.tempfile.path
    filename =file.original_filename
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='photos'
pathfirst=Rails.root.to_s+"/app/assets/images/"
abs=pathfirst+namefile
p abs
`mkdir -p #{pathfirst}; mv #{pathfile} #{abs};`
write_attribute(:image, namefile)
#save
    #image =Post.cloud([loc,filename].join('/'),pathfile)
    #if image
    #self.write_attribute(:image,image)
    #end
end

translates :name
has_many :drinkthingtasks
has_many :drinks, through: :drinkthingtasks

has_many :taskhaveepochs
has_many :epochs, through: :taskhaveepochs
def self.mysailorsepoch(t)
Task.find(t.taskid).sailors
end

has_many :taskmucheffortsailors
has_many :taskusedstuffs
has_many :things, through: :taskusedstuffs
def drinksisaid(userid)
drinkthingtasks.where(user_id: userid)

end
def thingsijustsaid(userid)
taskusedstuffs.where(use: 1)

end
def thingsisaid(userid)
taskusedstuffs.where(user_id: userid)

end

has_many :taskhasgithubrepos
has_many :githubrepos, through: :taskhasgithubrepos

has_many :taskshaveactions
has_many :taskactions, through: :taskshaveactions
has_many :sailorhaveattitudesintasks, foreign_key: 'task_id'
def limitfive
limit(5)

end

  has_many :completetasks, :foreign_key => "task_id"
has_many :tachesaccomplies, through: :completetasks, class_name: 'User', source: 'user'
has_many :sailortachesaccomplies, through: :completetasks, class_name: 'Person', source: 'person'
has_many :otherpersontachesaccomplies, through: :completetasks, class_name: 'Person', source: 'otherperson'
has_many :emotiontachesaccomplies, through: :completetasks, class_name: 'Emotion', source: 'emotion'
#####
  has_many :risktasksailors, :foreign_key => "task_id", class_name: 'Savedtasksailor'
has_many :risktachesailors, through: :risktasksailors, class_name: 'User', source: 'user'
has_many :risktaskonlysailors, through: :risktasksailors, class_name: 'Person', source: 'person'
  has_many :risktasks, :foreign_key => "task_id"
has_many :risktaches, through: :risktasks, class_name: 'User', source: 'user'
has_many :risksailors, through: :risktasks, class_name: 'Person', source: 'person'
  has_many :commenttasks, :foreign_key => "task_id"
has_many :commenttaches, through: :commenttasks, class_name: 'User', source: 'user'

  has_many :noterealizedtasks,  foreign_key: 'task_id'
  has_many :notetachesrealisees, :source => "user",:through => :noterealizedtasks, class_name: 'User'
  has_many :notetasks,  foreign_key: 'task_id'
  has_many :notetaches, :source => "user",:through => :notetasks, class_name: 'User'
  has_many :liketask,  foreign_key: 'task_id'
  has_many :aimetaches, :source => "user",:through => :liketask, class_name: 'User'
  has_many :dontliketask, foreign_key: 'task_id'
  has_many :aimepastaches, :source => "user", :through => :dontliketask,  class_name: 'User'
def self.findbyid(n)
where(id: n)
end
def moyrealizedtask
n=noterealizedtasks.pluck(:note)
m=n.sum.to_f/n.length.to_f
m.to_s[0..2]
end
def moytask
n=notetasks.pluck(:note)
m=n.sum.to_f/n.length.to_f
m.to_s[0..2]
end


belongs_to :country,optional:true
belongs_to :city,optional:true

has_and_belongs_to_many :worktwos, :join_table => :tasksworks
  #  has_and_belongs_to_many :events
has_and_belongs_to_many :attitudes, :join_table => :taskshaveattitudes
  has_and_belongs_to_many :addresses, :join_table => :taskhasmanyaddresses
  accepts_nested_attributes_for :addresses, allow_destroy: true
  has_and_belongs_to_many :supportmessages, :join_table => :messagefortasks, class_name: "Post" #encouragement pour une tâche
  has_and_belongs_to_many :things
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :gossips, :join_table => :taskhasmanygossips, class_name: "Aboutsomeonegossip"
  has_and_belongs_to_many :aboutsomeonegossips, :join_table => :taskhasmanygossips, class:"Aboutsomeonegossip"
  has_and_belongs_to_many :relatedpeople, class_name: 'Person'
  has_many :sailorjobs, class_name: 'Sailorjob'
  has_many :sailors, through: :sailorjobs, source: 'sailor'
  has_many :taskactionsailorjobs, through: :sailorjobs
  has_many :taskhavetaskactiontwosailorjobs, through: :taskactionsailorjobs
  has_many :collections, through: :sailors, source: :collections
  has_and_belongs_to_many :mycollections, class_name: 'Taskcollection', :join_table => :taskshavetaskscollections, foreign_key: "task_id"
has_many :mytvseries, class_name: 'Tvseries', through: :sailors, source: :tvseries

  has_many :relatedtaskstables, class_name: 'Additionaltask', foreign_key: 'maintask_id'
  has_many :relatedtasks, through: :relatedtaskstables, source: :relatedtask, class_name: 'Task'
  has_many :relatedsailors, through: :relatedtasks, source: :sailors
  has_many :maintasks, through: :relatedtaskstables, source: :maintask, class_name: 'Task'
  has_many :relatedevents, through: :relatedtaskstables, source: :event, class_name: 'Event'
  #taches informatiques/bureautiques
  has_and_belongs_to_many :emails
  accepts_nested_attributes_for :emails, allow_destroy: true

  has_and_belongs_to_many :recordings
  accepts_nested_attributes_for :recordings, allow_destroy: true

  has_and_belongs_to_many :itineraries, class_name: "Place"
  accepts_nested_attributes_for :itineraries, allow_destroy: true

  has_and_belongs_to_many :googlesearches, class_name: "GoogleRequest"
  accepts_nested_attributes_for :googlesearches, allow_destroy: true

  has_and_belongs_to_many :facebooksearches, :join_table => :linkfacebooksearchtasks
  accepts_nested_attributes_for :facebooksearches, allow_destroy: true
  before_validation :allmysailors, :on =>[:create, :update]
  #after_validation :savemysailors, :on =>[:create, :update]

  attr_accessor :everyone
  attr_accessor :mytaskwiththerecording, :sailorhavingthistask, :mysailorsgetter
def self.bycollection
all.distinct.left_joins(:mycollections).where("taskcollections.id" => nil).group("tasks.id")
end
def self.plusmentions
        tachesid = Post.joins(:actions).group('tasks.id').order("COUNT('tasks.id') desc").count.keys.first(5)
    Task.where(id: tachesid)

end
def myaccomplishments1
self.validatingtickets.map {|x|self.taskshaveaccomplishments.new(ticket:x, sailor: Person.new)}
end
def othersuccessfulpeople
(self.sailorssenders1_ids+self.sailorsrecipients1_ids+self.sailorssenders2_ids+self.sailorsrecipients2_ids).uniq
end
def successfulpeople

    self.sailors.select("people.*, a.sender_id as senderid, b.recipient_id as recipientid").joins('left join ticketshavesenders a on people.id = a.sender_id').joins('left join ticketshaverecipients b on people.id = b.recipient_id').where('a.sender_id is null and b.recipient_id is null')
end
def newfailureticket
    ticket=Ticket.new(failingtasks: [self])
    ticket.thereissender = true
    ticket.thereisrecipient = true
    ticket.senderknown = true
    ticket.recipientknown = true
    ticket

end
  def aproximite
    places=self.latitude && self.longitude && self.latitude.length > 0 && self.longitude.length > 0 ? [self]+Place.near([self.latitude.to_f, self.longitude.to_f], 100) : []
    places.pluck(:name, :latitude,:longitude)
  end

def newsuccessticket
    ticket=Ticket.new(successfultasks: [self])
    ticket.thereissender = true
    ticket.thereisrecipient = true
    ticket.senderknown = true
    ticket.recipientknown = true
    ticket

end
def fakegossip
self.name+" "+self.listsailors
end
def listsailors
self.sailors.pluck(:name).join(', ')
end
def self.mytasksfavourite(n)
where("id" => n)
end
def self.find_all_with_id(n)
where("id" => n)
end
def self.find_all_by_id(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        joins('left join sailorjobs s on s.task_id = tasks.id').joins('left join people sailors on sailors.id = s.person_id').where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ? or lower(sailors.name) like ? or lower(sailors.firstnames) like ? or lower(sailors.lastname) like ?",o,o,o,o,o,o]).select('sailors.*,s.*,tasks.*').group('tasks.id')

end
def self.find_by_name(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])

end

  def hasimage
    j=read_attribute(:image)
    j.to_s.length > 0
  end
  def allmysailors
    if everyone && everyone == true
      self.sailors=Person.all
    else

    end
  end
  def savemysailors
      if self.mysailorsgetter && self.mysailorsgetter.length > 0
      self.sailor_ids=self.mysailorsgetter.uniq
      end
  end

  def newnamecollection=(ids)
    mystr = ids.squish.strip
    if mystr.length > 0
    c=Taskcollection.find_or_create_by(name: mystr)
    mycollections << c
    end
  end
  def mycollection_ids=(ids)
    myids=ids.select{|x| !['',nil].include?(x)}
    if myids.length > 0
      myids.each do |id|
        mycollections << Taskcollection.find(id)
      end
    end
    
  end
  def happened
    read_attribute(:happened)
  end
  def mypostaboutsomeonesgossips
    Post.joins(:aboutsomeonegossips).where("aboutsomeonegossips.id" => aboutsomeonegossips.pluck(:id))
  end
  def happened=(tof)
    if tof == '1' && mypostaboutsomeonesgossips.length == 0

      post = Post.create(content_fr: "hourrah",content_en: "hurray",content_de: "hurray")
      post.aboutsomeonegossips << aboutsomeonegossips
      
    end
    write_attribute(:happened,tof)

  end
  has_many :resultsoffbsearches, through: :facebooksearches
  has_many :facebook_results, through: :resultsoffbsearches
  ###
  belongs_to :city, optional: true
  belongs_to :country, optional: true
  belongs_to :state, optional: true
  has_and_belongs_to_many :linkedtasks, join_table: :mylinkedtasks, class_name: "Task", foreign_key: "linkedtask_id"
  has_and_belongs_to_many :linkedtasksreverses, join_table: :mylinkedtasks, class_name: "Task", foreign_key: "task_id"
  has_many :taskshaveaccomplishments
  accepts_nested_attributes_for :taskshaveaccomplishments, allow_destroy: true
  has_many :accomplishedsailors, class_name: "Person", foreign_key: "sailor_id", through: :taskshaveaccomplishments, :source => :sailor
  has_and_belongs_to_many :tickets, class_name: "Ticket", :join_table => :tasksvalidatetickets
  has_and_belongs_to_many :failingtickets, class_name: "Ticket", :join_table => :tasksunvalidatetickets
  has_many :sailorssenders1, through: :validatingtickets, source: :senders
  has_many :sailorsrecipients1, through: :validatingtickets, source: :recipients
  has_many :sailorssenders2, through: :validatingtickets, source: :senders
  has_many :sailorsrecipients2, through: :validatingtickets, source: :recipients
  before_validation :uniqsailors, :on =>[:create, :update]
   has_and_belongs_to_many :aidememoires, class_name: "Aidememoire", :join_table => :taskshaveaidememoires
  accepts_nested_attributes_for :aidememoires, allow_destroy: true
    
  attr_accessor :addmyrelation_id, :addmyrelation_text, :addmybigrelation_id, :addmymiddlerelation_id

  after_validation :addotherrecords, :on =>[:create, :update]
  before_validation :savephrasesandwords, :on =>[:create, :update] 
  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :recordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :recordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2
  def savephrasesandwords
    #phrase and word
    if recordmyphrasesandwords1 && recordmywords1 && recordmyphrasesandwords1.length > 0 && recordmywords1.length > 0 && recordmyphrasesandwords1.length == recordmywords1.length
      @i=0
      1.times do
        @myam=self.aidememoires.new do |x|
          pandw=x.phraseandwords.new do |y|
        y.phrase= Phrase.find(self.myownphrasesandwords1[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords1[@i])
        y.word = Word.find(self.myownwords1[@i]) rescue Word.new(word: self.contentmyownwords1[@i])
            y.opposite=false
          end
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)
          paw=self.contentmyownphrasesandwords1[@i].strip.squish
          w=self.contentmyownwords1[@i].strip.squish
          x.recordedphrase=Recording.new(name: self.recordmywords1[@i], content: (paw.length > 0 ? paw : pandw.phrase.content))
          x.recordedword=Recording.new(name: self.recordmyphrasesandwords1[@i], content: (w.length > 0 ? w : pandw.word.content))

        end
      end
      
    end
    #word then phrase
    if recordmyphrasesandwords2 && recordmywords2 && recordmyphrasesandwords2.length > 0 && recordmywords2.length > 0 && recordmyphrasesandwords2.length == recordmywords2.length
      @i=0
      1.times do
      @myam=self.aidememoires.new do |x|
        pandw=x.phraseandwords.new do |y|
        y.phrase= Phrase.find(self.myownphrasesandwords2[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords2[@i])
        y.word = Word.find(self.myownwords2[@i]) rescue Word.new(word: self.contentmyownwords2[@i])
        y.opposite=true
        end
        paw=self.contentmyownphrasesandwords2[@i].strip.squish
        w=self.contentmyownwords2[@i].strip.squish
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)

        x.recordedphrase=Recording.new(name: self.recordmywords2[@i], content: (paw.length > 0 ? paw : pandw.phrase.content))
        x.recordedword=Recording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : pandw.word.content))
        
      end
      end
      
    end
    #two words
    if recordmywords1 && recordmywords2 && recordmywords1.length > 0 && recordmywords2.length > 0 && recordmywords1.length == recordmywords2.length
      @i=0
      1.times do
      @myam=self.aidememoires.new do |x|
        pandw=x.onlywords.new do |y|
        y.word1= Word.find(self.myownwords1[@i]) rescue Word.new(word: self.contentmyownwords1[@i])
        y.word2 = Word.find(self.myownwords2[@i]) rescue Word.new(word: self.contentmyownwords2[@i])
        y.opposite=false
        end
        paw=self.contentmyownwords1[@i].strip.squish
        w=self.contentmyownwords2[@i].strip.squish
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)

        x.recordedphrase=Recording.new(name: self.recordmywords1[@i], content: (paw.length > 0 ? paw : pandw.word1.content))
        x.recordedword=Recording.new(name: self.recordmywords2[@i], content: (w.length > 0 ? w : pandw.word2.content))
        
      end
      @i+=1
      end
      
    end
#onlyphrases
    if recordmyphrasesandwords1 && recordmyphrasesandwords2 && recordmyphrasesandwords1.length > 0 && recordmyphrasesandwords2.length > 0 && recordmyphrasesandwords1.length == recordmyphrasesandwords2.length
      @i=0
      1.times do
      @myam=self.aidememoires.new do |x|
        pandw=x.onlyphrases.new do |y|
        y.phrase1= Phrase.find(self.myownphrasesandwords1[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords1[@i])
        y.phrase2 = Phrase.find(self.myownphrasesandwords2[@i]) rescue Phrase.new(content: self.contentmyownphrasesandwords2[@i])
        end
        paw=self.contentmyownphrasesandwords1[@i].strip.squish
        w=self.contentmyownphrasesandwords2[@i].strip.squish
        p Relation.where(id: self.addmyrelation_id)
          x.relations = Relation.where(id: self.addmyrelation_id)
          x.bigrelations = Relation.where(id: self.addmybigrelation_id)
          x.middlerelations = Relation.where(id: self.addmymiddlerelation_id)
        p x.relations
        p x.errors
        p x.errors
        x.recordedphrase=Recording.new(name: self.recordmyphrasesandwords1[@i], content: (paw.length > 0 ? paw : pandw.phrase1.content))
        x.recordedword=Recording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : pandw.phrase2.content))
        
      end
      @i+=1
      end
      
    end


    
    

    
  end
  def aidememoiresanticlockwise
    self.aidememoires.reverse
  end
  def addotherrecords
    if @myam
    self.aidememoires << @myam 
    end
        @alltasks=Task.where(id: self.mytaskwiththerecording).where.not(id: self.id)
    if @alltasks.length > 0
      @alltasks.each do |t|
        t.aidememoires << @myam
      end
    end
    @allsailors =Person.where(id: self.sailorhavingthistask)
    if @allsailors.length > 0
      @allsailors.each do |t|
        t.aidememoires << @myam
      end
    end

  end

  def uniqsailors
    p self.taskshaveaccomplishments, "task have accomplishments"
    self.taskshaveaccomplishments.update_all({updated_at: DateTime.now})
  end
  def self.recentsailortasks(idreac_ids = nil)
    Person.where("id"=>(Task.order('created_at desc').left_joins(:sailors).select('people.id').limit(10).uniq+(idreac_ids ? Reaction.where('id'=>idreac_ids).left_joins(:reactingpeople).select('people.id').distinct : [])))
  end
  def address
    addresses.last
  end

  def collection_first_sailor
    self.sailors.first.collections.first
  end
  def relatedpeopleinputs=(ids)
    self.save
    self.relatedperson_ids << ids
  end
  def self.encemoment
    k = DateTime.now
    intervalleavant = k.months_ago(3)
    intervalleapres = k.next_month(3)
    where("start_at < ? and end_at > ?",intervalleavant,intervalleapres)
  end
  def relatedtasksinputs=(ids)
    self.save
    self.relatedtask_ids << ids
  end
  def othersailors(person)
    person ? self.sailors.where.not(id:person.id) : []

  end

  def eventid=(id)
    self.events << Event.find(id)
  end
  def personid=(id)
    self.sailors << Person.find(id) #lire des articles 
    
  end
  #def person_ids=(ids)
   #rajouter une table taches comme sailor tasks ou taches avec d'autres gens 
  #end
def self.nbpages
all.length / 10
end
def self.bypage(i)
all.limit(10).offset(i.to_i * 10)
end


  
end
