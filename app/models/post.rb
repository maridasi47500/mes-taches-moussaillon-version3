require 'aws-sdk-s3'
require 'net/http'
require 'assets/hacking_type'

class Post < ActiveRecord::Base
has_many :reactiontrueimages
has_many :reactionpics, through: :reactiontrueimages, source: :reactionpic
def self.findbycontent(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(content_en) like ? or lower(content_fr) like ? or lower(content_de) like ?",o,o,o]).limit(10)
end
def self.findform
Dir.glob("#{Rails.root}/app/views/**/_form.html.erb").map {|h|h.split("views/")[1].split("/_form")[0]}.sample
end
def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(content_en) like ? or lower(content_fr) like ? or lower(content_de) like ?",o,o,o])
end

attr_accessor :wid,:hei, :addamap
before_validation :mymapsvalid
def mymapsvalid
file=self.addamap
    if file && !file.is_a?(String)

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
mymaps.new(:image=>file.original_filename,width: self.wid,height: self.hei)

    end
end

has_many :postshavemymaps
has_many :mymaps, through: :postshavemymaps

has_many :posthavesongs
has_many :songs, through: :posthavesongs

has_many :listhackedi18nphrases
has_many :i18nphrases, through: :listhackedi18nphrases

has_many :listhackedhernothers
has_many :hernothers, through: :listhackedhernothers

has_many :listhackedthistasknotthistasks
has_many :thistasknotthistasks, through: :listhackedthistasknotthistasks

has_many :postshavesocialmovements
has_many :socialmovements, through: :postshavesocialmovements
  def imagesdessin=(file)
  photos =[]
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      photos.push({name: filename})
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
    `mv #{pathfile} #{abs}`
  newphotos=self.photos.new(photos) #valeur temporaire de user_id
  #.add authors here

end

has_and_belongs_to_many :addresses, :join_table => :postshaveaddresses
    accepts_nested_attributes_for :addresses, allow_destroy: true
  has_and_belongs_to_many :robots, :join_table => :postshaverobots
  has_and_belongs_to_many :tickets, :join_table => :postshavetickets
    accepts_nested_attributes_for :tickets, allow_destroy: true

  has_and_belongs_to_many :tweets, :join_table => :postshavetweets
  has_and_belongs_to_many :jingles, class_name: 'Jingle'
  accepts_nested_attributes_for :jingles, allow_destroy: true

  has_and_belongs_to_many :supporttasks, :join_table => :messagefortasks, class_name: "Task" #encouragement pour une tâche
  has_many :tendances
  accepts_nested_attributes_for :tendances, allow_destroy: true
  has_and_belongs_to_many :dishes, :join_table => :postsaboutdishes 
  accepts_nested_attributes_for :dishes, allow_destroy: true 
  has_and_belongs_to_many :words, :join_table => :wordsforposts
  accepts_nested_attributes_for :words, allow_destroy: true
  translates :content
  has_and_belongs_to_many :arguments, :join_table => :argumentsposts
  has_and_belongs_to_many :techniques, :join_table => :techniquesposts
  has_and_belongs_to_many :fakecomments, :join_table => :fakecomenttables
  accepts_nested_attributes_for :fakecomments, allow_destroy: true
  has_and_belongs_to_many :google_requests, :join_table => :requetegooglesposts, class_name: "GoogleRequest"
  accepts_nested_attributes_for :google_requests, allow_destroy: true
  has_and_belongs_to_many :facebook_requests, :join_table => :requetefacebooksposts, class_name: "FacebookRequest"
  accepts_nested_attributes_for :facebook_requests, allow_destroy: true

#  has_and_belongs_to_many :things, :join_table => :postsaboutthings
#  accepts_nested_attributes_for :things, allow_destroy: true
  has_and_belongs_to_many :emails, :join_table => :postsandemails
  accepts_nested_attributes_for :emails, allow_destroy: true
  has_and_belongs_to_many :companies, :join_table => :postsrefcompanies
  accepts_nested_attributes_for :companies, allow_destroy: true
  has_and_belongs_to_many :places, :join_table => :placesandposts
  accepts_nested_attributes_for :places, allow_destroy: true
  has_and_belongs_to_many :movies, :join_table => :postsrefmovies
  accepts_nested_attributes_for :movies, allow_destroy: true
  has_and_belongs_to_many :webpages, :join_table => :postsrefwebpages
  accepts_nested_attributes_for :webpages, allow_destroy: true
  has_and_belongs_to_many :synonyms
  accepts_nested_attributes_for :synonyms, allow_destroy: true
  has_and_belongs_to_many :onetimes, :join_table => :postpeopleonetimes
  has_one :attitude
  accepts_nested_attributes_for :attitude, allow_destroy: true
  has_many :metonymies
  accepts_nested_attributes_for :metonymies, allow_destroy: true
  has_and_belongs_to_many :anaphors
  accepts_nested_attributes_for :anaphors, allow_destroy: true
  has_many :nicephotos, through: :anaphors, class_name:'Photo'
  before_validation :saveallphotos, :on => :create
  before_validation :saveallphotos, :on => :update
  has_and_belongs_to_many :messagecaches, :join_table => :posthavehiddenmessages, class_name: "Messagecache"
  accepts_nested_attributes_for :messagecaches, allow_destroy: true
  has_and_belongs_to_many :moviescenes, :join_table => :postsreftomoviescenes
  accepts_nested_attributes_for :moviescenes, allow_destroy: true
    has_and_belongs_to_many :threads, :join_table => :threadhavemanyposts, class_name: "Poststhread"
accepts_nested_attributes_for :threads, allow_destroy: true
  def mycontent
    content.to_s
  end
  def threads_attributes=(t)
    p t
    k=t.values
    k.each do |thread|
      p thread
      m=Poststhread.find_or_initialize_by(thread)
      threads << m rescue next
    end
  end
  def saveallphotos
    self.nicephotos.where(name:nil).destroy_all
    self.nicephotos.where(name: '').destroy_all
    self.anaphors.joins(:nicephotos).where(photos:{name:nil}).destroy_all
    self.anaphors.joins(:nicephotos).where(photos:{name: ''}).destroy_all
  end
  def messagecache=(x)

    if x && x.length > 0
      save
    self.messagecaches.find_or_create_by(content: x)
    end
  end
  has_many :posts_surnames, class_name: "PostsSurname"
  has_and_belongs_to_many :my_posts_surnames, :join_table => :postssurnamesforposts, class_name: "PostsSurname"
  accepts_nested_attributes_for :my_posts_surnames, allow_destroy: true
  has_many :peoplehackedinjingles, through: :jingles, source: :person
  has_many :contents
  accepts_nested_attributes_for :contents
  has_many :people_hacked, through: :posts_surnames, source: :person
  has_many :peopletalkedabout, through: :posts_surnames, source: :sailor
  has_many :surnames, through: :posts_surnames
  has_many :my_surnames, through: :my_posts_surnames, class_name: "Surname", source: :surname
  has_many :my_avatars, through: :my_posts_surnames, source: :avatar
  has_many :my_destinataires, through: :my_posts_surnames, source: :destinataire
  has_many :my_people, through: :my_posts_surnames, source: :person

  has_many :your_surnames, through: :your_posts_surnames, class_name: "Surname", source: :surname
  has_many :your_avatars, through: :your_posts_surnames, source: :avatar
  has_many :your_destinataires, through: :your_posts_surnames, source: :destinataire
  has_many :your_people, through: :your_posts_surnames, source: :person

  has_many :peopleintheusurpations, through: :posts_surnames, source: :person
  has_many :surnamedpeople, through: :posts_surnames, source: :sailor
  accepts_nested_attributes_for :posts_surnames, allow_destroy: true
  accepts_nested_attributes_for :my_posts_surnames, allow_destroy: true

  has_and_belongs_to_many :main_threads
  accepts_nested_attributes_for :main_threads, allow_destroy: true

  has_and_belongs_to_many :collections
  has_and_belongs_to_many :actions, class_name: 'Task'
  has_and_belongs_to_many :sailortasks, class_name: 'Task'
  has_and_belongs_to_many :sailorjobs, class_name: 'Task'
  has_and_belongs_to_many :usualactions, class_name: 'Routine'
  has_and_belongs_to_many :events
  accepts_nested_attributes_for :events, allow_destroy: true

  has_many :sailors, through: :actions
#tache future / projet futur/passe
  has_many :personcomments
  has_many :commentedpeopleinputs, through: :personcomments, source: :person
  has_many :otherpostsinputs, class_name:'PostsPost'
  has_many :lotsofotherposts, class_name:'Post', through: :otherpostsinputs, source: :otherpost
  has_many :trolledpeople, class_name:'Person', through: :lotsofotherposts, source: :authors
  has_and_belongs_to_many :post_types
  has_and_belongs_to_many :recordings
  alias_attribute :commentedpeople, :commentedpeopleinputs
  has_and_belongs_to_many :videos
  has_and_belongs_to_many :photos
    accepts_nested_attributes_for :photos
  has_many :answers, class_name: 'Post', foreign_key: "post_id"
  has_many :comments, class_name: 'Post', foreign_key: "post_id"
  belongs_to :oldercomment, class_name: 'Post', foreign_key: "post_id", optional: true
  has_many :authortables
  has_many :authors, through: :authortables, source: :user
  has_and_belongs_to_many :reactions
  accepts_nested_attributes_for :reactions, allow_destroy: true
  has_many :reactingpeople, class_name: 'Person', through: :reactions, source: :reactingpeople
    has_many :reactingpeoplegrouped, through: :reactions, source: :reactingpeople

    #### soucis 
      accepts_nested_attributes_for :reactingpeople, allow_destroy: true

  has_many :acquaintances
  has_many :hackedpeople, through: :acquaintances

    has_many :usurpationsothertables, class_name: 'AcquaintancesOfMyAcquaintance' 
    #user of this site but not necessarily
    
  has_many :usurpationrelatedpeople, through: :usurpationsothertables
  has_many :tablecommeelles, class_name: "Usurpation", foreign_key: 'post_id'
  has_many :commeelles, through: :tablecommeelles, class_name: 'Person', source: :person

  has_many :doubles, class_name: 'Double'
  has_many :usurpations, class_name: 'Person', through: :doubles
has_and_belongs_to_many :tvseries

  has_many :recipients, class_name: 'Recipient'
    has_many :destinataires, class_name:'Person',through: :recipients

  belongs_to :article, class_name: 'Post', foreign_key: "post_id", optional: true
  belongs_to :post, class_name: 'Post', foreign_key: "post_id", optional: true
  belongs_to :author, class_name: 'User', foreign_key: "user_id", optional: true
  
alias_attribute :otherposts, :lotsofotherposts
      has_many :a_propos_delles, class_name: "AProposDelle", source: :person
  has_many :postsaproposdelles, through: :a_propos_delles, class_name: 'Person', source: :person
    has_many :pareilquelles, class_name: "Meme", source: :post
  has_many :personnessimilaires, through: :pareilquelles, class_name: 'Person', source: :person
  has_many :dumemeavisquelles, class_name: "Memepensee", source: :post
  has_many :avissimilaires, through: :dumemeavisquelles, class_name: 'Person', source: :person
  has_many :numerouspeople, through: :posts_surnames, source: :person
  has_many :profilepicspossible, through: :numerouspeople, source: :profilepictures
  has_many :profilepicspossiblebis, through: :posts_surnames, source: :profilepics
  has_many :profilepicschosen, through: :posts_surnames, source: :profilepic
  has_one :displaygossip, foreign_key: "Postid"
  accepts_nested_attributes_for :displaygossip, allow_destroy: true
  has_and_belongs_to_many :historical_characters, :join_table => :postsrefhistoricalcharacters
  has_and_belongs_to_many :comicbooks, :join_table => :postsrefcomicbooks
  has_and_belongs_to_many :epochs, :join_table => :postslinkedepochs
  accepts_nested_attributes_for :epochs, allow_destroy: true
  has_and_belongs_to_many :fromsomeonegossips, :join_table => :gossipsforpostsfromsomeones
  accepts_nested_attributes_for :fromsomeonegossips, allow_destroy: true
  has_and_belongs_to_many :aboutsomeonegossips, :join_table => :gossipsforposts
  accepts_nested_attributes_for :aboutsomeonegossips, allow_destroy: true
  has_and_belongs_to_many :proposals, :join_table => :postshaveproposals
  accepts_nested_attributes_for :proposals, allow_destroy: true
  has_many :votes, through: :proposals
  has_and_belongs_to_many :mylayouts, :join_table => :myspeciallayouts
  accepts_nested_attributes_for :mylayouts, allow_destroy: true
  has_many :postlikecomments
  has_many :mysailors, through: :postlikecomments, source: :sailor
  has_many :mytasks, through: :postlikecomments, source: :task
  has_many :myattitudes, through: :postlikecomments, source: :attitude
  has_many :mysetoftasks, through: :postlikecomments, source: :setoftask
  has_many :mytaskstuff, through: :postlikecomments, source: :thing
  accepts_nested_attributes_for :postlikecomments, allow_destroy: true
  has_many :myownsurnames, through: :my_posts_surnames, source: :surname
has_many :meanings, class_name: 'PostsSurnameMeaning', through: :my_posts_surnames, source: :meanings
  def content_fr=(cont)
    write_attribute(:content_fr, cont)
  end 
  def content_en=(cont)
    write_attribute(:content_en, cont)
  end 
  def content_de=(cont)
    write_attribute(:content_de, cont)
  end 
  def self.nombregossipstrue
    select('posts.*, aboutsomeonegossips.*, aboutsomeonegossips.content as CONTENT, aboutsomeonegossips.true as TRUE').group('posts.id').having('aboutsomeonegossips.created_at < posts.created_at').select("SUM(CASE
              WHEN aboutsomeonegossips.true is null then 0
                                                                                                                                                  WHEN aboutsomeonegossips.true = 0 then 0

                                                                                                                                                      WHEN aboutsomeonegossips.true = 1 then 1
                                                                                                                                                          ELSE 0
                                                                                                                                                          END) AS quantitytrue")[0].quantitytrue

  end
  def mygossips
    Post.where(id: id).joins(:aboutsomeonegossips).select('posts.*, aboutsomeonegossips.*, aboutsomeonegossips.content as CONTENT, aboutsomeonegossips.id as gossipsid')
  end
  def mymoviescenes
    
    Moviescene.last(10)+moviescenes
  end
  def self.pasceuxdestvseries
    joins('left join ')
  end
  def mycomicbooks
    p comicbooks
    Comicbook.last(10)+comicbooks
  end
def myprofilepicschosen
  #self.posts_surnames.joins(:profilepic).select('profilepictures.*')
  #self.posts_surnames.joins(:profilepic).as_json
  #Post.where(id: self.id).joins(:profilepicschosen).select('profilepictures.*')
  p self.posts_surnames
  #self.posts_surnames.joins(:profilepic).select('profilepictures.*')
  Profilepicture.where(id: self.posts_surnames.pluck(:profilepic_id))

end
def mostrecentreactions
  ((Reaction.where.not(name: [nil,""])+Reaction.where.not(myownreaction: nil)).last(10)+self.reactions).uniq
  
  
end
def myprofilepicspossible
  #self.numerouspeople.joins(:profilepictures).select('profilepictures.*')
  #self.numerouspeople.joins(:profilepictures).as_json
  #Post.where(id: self.id).joins(:profilepicspossible).select('profilepictures.*')
  p "possiblepics"
  #p self.posts_surnames.joins(:profilepics)
  #self.posts_surnames.joins(:profilepics).select('profilepictures.*').as_json
  p self.posts_surnames.map {|x| x.person_id}
  Person.where(id: self.posts_surnames.map {|x| x.person_id}).joins(:profilepictures).select('profilepictures.*')

end
def things
  self.tvseries+self.sailorjobs
end
def posts_surnames_to_display
  self.posts_surnames.where(posts_surname: nil)
end
def aboutpost
  self.commentedpeople.count > 0 #&& self.usurpations.count == 0 && self.hackedpeople.count == 0 && self.commeelles.count== 0 && self.destinataires.count == 0
end
  def rootsurnames
       self.posts_surnames.where(posts_surname_id: nil)

  end
    def self.firstpostofthethread
where(post_id:nil)
end
  def othersurnames
       self.posts_surnames.where.not(posts_surname_id: nil)

  end
    def group
    end
    def people
    end

  def whois #leprecedent
    all=self.rootsurnames
    allother =self.othersurnames
    allother.last||all.last 
    #all+allother
  end

def self.typesofhacking
  [['usurpations','usurpation_ids'],['posts à propos de lui','postsaproposdelle_ids'],['je parle aussi de','personnessimilaire_ids'],['elles pourraient etre du meme avis','avissimilaire_ids'],['as','hackedperson_ids'],['comme elles','commeelle_ids'],['destinataires','destinataire_ids'],['commented people','commentedperson_ids']]

end
def commentedperson_ids=(ids)
if ids && ids.length > 0
ids.delete('')

  save
  self.commentedpeopleinput_ids = ids
  end
end

def self.hackingtypes
  types=Post.typesofhacking
types.map {|x|HackingType.new(x)}
end
def lequelhacker(postsurname)
self.posts_surnames.each do |ps|
            if ps==postsurname

ps.posts_surnames.each do |ps2|
        if ps2==postsurname

end
end

end
end
end
  def lastpost
    
  self.posts_surnames.last
  end
def posts(moussaillon)
self.posts_surnames.where(sailor: moussaillon).last||[PostsSurname.new]
end
def postssurname(moussaillon)
self.posts_surnames.where(sailor: moussaillon).last
end

def authors=(a)
self.author_ids << a.pluck(:id)

end
def author_ids=(a)
self.manyauthor_ids << a

end
  def commentapost=(id)
    if id.length > 0
      post=Post.find_by('id'=>id)
      post.comments << self
    end
  rescue NoMethodError
  end
  def otherposts=(ids)
    if ids.length > 0
  
posts=Post.where('id'=>ids.split(', '))
self.lotsofotherposts = posts unless self.lotsofotherposts == posts
    end
  end
  def auteurrecording=(auteurid)
    self.write_attribute(:user_id, auteurid)
  end
  def photos=(files)
  photos =[]
  files.each do |file|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      photos.push({name: filename})
      loc='photos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
    `mv #{pathfile} #{abs}`
    Post.cloud([loc,filename].join('/'),abs)
  end
  newphotos=self.photos.new(photos) #valeur temporaire de user_id
  #.add authors here

end
  def moussaillonsdecepost
    (self.usurpations+self.commentedpeopleinputs+self.reactingpeople+self.commeelles+self.destinataires+self.hackedpeople).uniq
  end

  def self.personid(id)
    @person=Person.find(id)
    Post.joins(:usurpations).where(people: {id:@person.id}).and(Post.joins(:commentedpeopleinputs).where(people: {id:@person.id})).and(Post.joins(:reactingpeople).where(people: {id:@person.id})).and(Post.joins(:commeelles).where(people: {id:@person.id})).and(Post.joins(:destinataires).where(people: {id:@person.id})).and(Post.joins(:hackedpeople).where(people: {id:@person.id}))
  end
  def jingles=(files)
  jingles =[]
  files.each do |file|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      jingles.push({name: filename})
      loc='jingles'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
    `mv #{pathfile} #{abs}`
    Post.cloud([loc,filename].join('/'),abs)
  end
  newphotos=self.jingles.new(jingles) #valeur temporaire de user_id
  #.add authors here

end

  def recordings=(files)
    recordings=[]
    files.each do |file|
        pathfile = file.tempfile.path
        filename =pathfile.split('/').last
        loc='recordings'
        abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
      `mv #{pathfile} #{abs}`
      #name=Post.cloud([loc,filename].join('/'),pathfile)
              recordings.push({name: filename})

    end
    newrecordings=self.recordings.new(recordings) #valeur temporaire de user_id
  end
  def self.cloud(object_key,filepath)
s3_resource=Aws::S3::Resource.new(region: 'us-east-1')
      bucket_name="newmanskillalexa001"
      object_content=File.open(filepath).read
    object = s3_resource.bucket(bucket_name).object(object_key)
    p "CLOUD"
    p object
    url = URI.parse(object.presigned_url(:put))
http_client=nil
    if http_client.nil?
      Net::HTTP.start(url.host) do |http|
        http.send_request(
          'PUT',
          url.request_uri,
          object_content,
          'content-type' => ''
        )
      end
    else
      http_client.start(url.host) do |http|
        http.send_request(
          'PUT',
          url.request_uri,
          object_content,
          'content-type' => ''
        )
      end
    end
    content = object.get.body
    puts "The presigned URL for the object '#{object_key}' in the bucket " \
      "'#{bucket_name}' is:\n\n"
    puts url
    puts "\nUsing this presigned URL to get the content that " \
      "was just uploaded to this object, the object\'s content is:\n\n"
    #content.read
    i=url.to_s.index('?')
    return url.to_s[0..i-1]
  rescue StandardError => e
    puts "Error uploading to presigned URL: #{e.message}"
    return false
  end
  def videos=(files)
  videos =[]
  files.each do |file|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      videos.push({name: filename})
      loc='videos'
      abs=Rails.root.to_s+"/app/assets/#{loc}/#{filename}"
    `mv #{pathfile} #{abs}`
    #Post.cloud([loc,filename].join('/'),abs)
  end
  newvideos=self.videos.create!(videos) #valeur temporaire de user_id
  #.add authors here

end

    def usurpationname=(name)
      self.usurpationswithotherusers.create!(name: name)
    end
  def doublesdesdoubles #renvoie des objets personnes
    @all =[]
    self.doubles.each do |double|
      @dbl = double
      while @dbl.sondouble do
        @dbl =@dbl.sondouble
        @all.push(@dbl.usurpation)
      end
    end
    @all
  end
  def checkvalidated
    #un post peut etre valides si tous les utiisateurs sont aussi les personnes du post (post.people)
    #tout les users peutvent s'ajouter leur 
    #ou si  le post a été vu 
    #
    #combien de gens faut il pour que les destintaires soitent vrais ou que le post soit validé
    #
    #ou si les users/persons sont sélectionnés avant, un formulaire pourrait servir à valider un ticket/post
    #non valide
  end
  def double_ids=(ids)
    @dbl = self.double
    while ids.length > 0 do
      if @dbl.usurpation
        @dbl.double_id = ids[0]
        @dbl = Double.find(ids[0])
        ids.shift
      end
    end
  end
  def expired=(date)
    if date == "1"
      self.write_attribute(:expired, DateTime.now.localtime)

    elsif date == "0"
      self.write_attribute(:expired, nil)
    end
  end
  def self.current
    Post.all.limit(3).to_a
end
  def profilepic
    if self.author
      self.author.image
    end
	end
	def person_id=(id)
    self.usurpations << Person.find(id)
  rescue ActiveRecord::RecordInvalid
  end
  def user_id=(id)
    self.authors << [User.find(id)]
  rescue ActiveRecord::RecordInvalid
  end
      def self.findthem(o)
      #joins('left join events place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('posts_surnames.*,avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid').where(['avatar.name like ? or posts_surnames.content_fr like ? or posts_surnames.content_en like ? or posts_surnames.content_de like ? or rec.name like ? or s.name like ? or t.name like ? or pp.nameimage like ? or place.name like ?']+Array.new(9,o))
    joins('left join tasks place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar2 on posts_surnames.speaklike_id = avatar2.id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('posts_surnames.*,avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid, (case when s.name is not null and length(s.name) > 0 then s.name else avatar2.name end) as myname1').where(['length(s.name) > 0 and avatar.name like ? or posts_surnames.content_fr like ? or posts_surnames.content_en like ? or posts_surnames.content_de like ? or rec.name like ? or s.name like ? or t.name like ? or pp.title like ? or place.name like ? or avatar2.name like ?']+Array.new(10,o))

  end

end
