class PostsSurname < ApplicationRecord
has_many :postssurnamesforposts
has_many :posts, through: :postssurnamesforposts
has_many :otherinterestingpeople
has_many :other_posts_surnames, through: :otherinterestingpeople, source: :other_posts_surname
after_initialize :setmysurname
def setmysurname
if self.surname
self.new_surname=self.surname.try(:name)
end
end
before_validation :createdme, on: :create
def createdme
self.created_at=DateTime.now
end
before_validation :updateme, on: :update
def updateme
self.updated_at=DateTime.now
end
#le lier a un aide memoire (2e modal)
#le lier a un ticket (modal)
#cherche les posts suname
#supprimer une tache a un moussaillon ou attribuer une tache=invalid/valid task with a ticket
def self.todays
where("created_at > ? or updated_at > ?", DateTime.now.beginning_of_day, DateTime.now.beginning_of_day)
end
def nomdecettepersonne
if avatar
self.avatar.name
elsif sailor
sailor.name
elsif person
person.name
end
end
has_many :meanings, class_name: 'PostsSurnameMeaning', foreign_key: 'ps_id'
def myname1
read_attribute(:myname1) || ""
end
def psid
read_attribute(:psid) || self.id
end
def personcom
meanings.pluck(:person_id).join(', ')
end
def surnamecom
meanings.pluck(:surname_id).join(', ')
end
def speaklikecom
meanings.pluck(:speaklike_id).join(', ')
end
def self.surnameswithid(i)
      PostsSurname.where(id: i).mysurnames
end

#faire un model memorycard avec habtm de phrase et words
attr_accessor :recordingmylanguage, :recordingmyemotion
attr_accessor :addmyrelation_id
  #devise :database_authenticatable
  devise
  belongs_to :thing, optional: true
  belongs_to :surnamedestinataire,optional: true, class_name: "Surname"


   belongs_to :place, optional: true
  belongs_to :profilepic, optional: true, class_name: 'Profilepicture', foreign_key: "profilepic_id"
  accepts_nested_attributes_for :profilepic
  has_many :profilepics, through: :person, class_name: 'Profilepicture', source: :profilepictures
   belongs_to :posts_surname, optional: true
   belongs_to :other_posts_surname,class_name:'PostsSurname', optional: true
  belongs_to :sentencerecording, foreign_key: "recordingphrase_id", class_name: "Recording", optional: true
accepts_nested_attributes_for :sentencerecording
  belongs_to :surnamerecording, foreign_key: "recordingword_id", class_name: "Recording", optional: true
accepts_nested_attributes_for :surnamerecording
  belongs_to :sailor, class_name: 'Person', optional: true
  accepts_nested_attributes_for :sailor
  belongs_to :destinataire, optional: true, foreign_key: "destinataire_id", class_name: "Person"
  belongs_to :avatar, optional: true, foreign_key: "speaklike_id", class_name: "Person"
  belongs_to :stranger, optional: true, foreign_key: "stranger_id", class_name: "Person"
   belongs_to :person, optional: true, foreign_key: "person_id"
  accepts_nested_attributes_for :place, allow_destroy: true
  accepts_nested_attributes_for :person
  belongs_to :realname, optional: true, foreign_key: "realname_id", class_name: "Surname"
  belongs_to :post, foreign_key: 'post_id', class_name: 'Post', optional: true
  belongs_to :surname, optional: true#, :autosave => true
  attr_accessor :new_surname
  accepts_nested_attributes_for :surname
  before_validation :mysurnameedit
  def mysurnameedit
    if new_surname
      self.surname = Surname.find_or_create_by(name: new_surname)
    end
  end
  


  translates :content
    has_and_belongs_to_many :my_posts, :join_table => :postssurnamesforposts, class_name: "Post"
    has_and_belongs_to_many :my_surnames, :join_table => :lotsofsurnames, class_name: "Surname"

  before_validation :savephrasesandwords, :on =>[:create, :update] 
after_save :savelanguageemotion
  attr_accessor :recordmyphrasesandwords, :recordmywords, :myownphrasesandwords, :contentmyownphrasesandwords, :myownwords, :contentmyownwords, :recordmyphrasesandwords1, :recordmywords1, :myownphrasesandwords1, :contentmyownphrasesandwords1, :myownwords1, :contentmyownwords1, :recordmyphrasesandwords2, :recordmywords2, :myownphrasesandwords2, :contentmyownphrasesandwords2, :myownwords2, :contentmyownwords2
def self.find_by_id(id)
where(id:id)
end
  def aidememoiresanticlockwise
    a=[]
    a.push(self.sentencerecording) if self.sentencerecording
    a.push(self.surnamerecording) if self.surnamerecording
    a
  end


  def self.findbyid(o)
    joins('left join tasks place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar2 on posts_surnames.speaklike_id = avatar2.id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid, (case when s.name is not null and length(s.name) > 0 then s.name else avatar2.name end) as myname1,place.*,posts_surnames.*').where('posts_surnames.id' => o)
  end
  def self.findbyname(o)
     h='%'+o.gsub(' ','%')+'%'
    joins('left join tasks place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar2 on posts_surnames.speaklike_id = avatar2.id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid, (case when s.name is not null and length(s.name) > 0 then s.name else avatar2.name end) as myname1,place.*,posts_surnames.*').where(['length(s.name) > 0 and avatar.name like ? or posts_surnames.content_fr like ? or posts_surnames.content_en like ? or posts_surnames.content_de like ? or rec.name like ? or s.name like ? or t.name_'+I18n.locale.to_s+' like ? or pp.title like ? or place.name_en like ? or place.name_fr like ? or place.name_de like ? or avatar2.name like ? or pp.description like ? or person.description like ? or avatar2.description like ? or avatar.description like ? or rec.description like ?']+Array.new(17,h))

  end
  def self.findthem(o)
      #joins('left join events place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('posts_surnames.*,avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid').where(['avatar.name like ? or posts_surnames.content_fr like ? or posts_surnames.content_en like ? or posts_surnames.content_de like ? or rec.name like ? or s.name like ? or t.name like ? or pp.nameimage like ? or place.name like ?']+Array.new(9,o))
    joins('left join tasks place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar2 on posts_surnames.speaklike_id = avatar2.id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid, (case when s.name is not null and length(s.name) > 0 then s.name else avatar2.name end) as myname1,place.*,posts_surnames.*').where(['length(s.name) > 0 and avatar.name like ? or posts_surnames.content_fr like ? or posts_surnames.content_en like ? or posts_surnames.content_de like ? or rec.name like ? or s.name like ? or t.name_'+I18n.locale.to_s+' like ? or pp.title like ? or place.name_en like ? or place.name_fr like ? or place.name_de like ? or avatar2.name like ? or pp.description like ? or person.description like ? or avatar2.description like ? or avatar.description like ? or rec.description like ?']+Array.new(17,o))

  end
  def self.nopage(no)
    limit(10).offset(((no.to_i == 0 || no.to_i == 1 || !no ) ? 0 : no.to_i) * 10)
  end
  def self.mysurnames2
    Person.where(id: joins('left join tasks place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar2 on posts_surnames.speaklike_id = avatar2.id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('posts_surnames.*,avatar.*, person.*, rec.*, s.*,avatar2.*').pluck('avatar2.id'))
  end
  def self.mysurnames
    joins('left join tasks place on place.id = posts_surnames.place_id').joins('left join profilepictures pp on pp.id = posts_surnames.profilepic_id').joins('left join things t on t.id = posts_surnames.thing_id').joins('left join people person on person.id = posts_surnames.person_id').joins('left join people avatar2 on posts_surnames.speaklike_id = avatar2.id').joins('left join people avatar on posts_surnames.sailor_id = avatar.id').joins('left join people rec on rec.id = posts_surnames.destinataire_id').joins('left join surnames s on s.id = posts_surnames.surname_id').select('posts_surnames.*,avatar.*, person.*, rec.*, s.*, posts_surnames.content_fr as pscont, posts_surnames.id as psid, (case when s.name is not null and length(s.name) > 0 then s.name else avatar2.name end) as myname1')
  end
  def savephrasesandwords
    #phrase and word
    @i=0
    #if self.recordmyphrasesandwords2 && self.recordmyphrasesandwords2.length > 0
    # #
    #    begin
    #    phrase= Phrase.find(self.myownphrasesandwords2[@i]) 
    #     rescue 
    #    phrase=Phrase.new(content: self.contentmyownphrasesandwords2[@i]) rescue Phrase.new
    #     end

    #      w=self.contentmyownphrasesandwords2[@i].strip.squish rescue ""

    #      @rec1=self.sentencerecording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : phrase.content))



    #    end
    if self.recordmyphrasesandwords1 && self.recordmyphrasesandwords1.length > 0 && self.recordmyphrasesandwords2 && self.recordmyphrasesandwords2.length > 0
p "phrase amd phrase"
        begin
	phrase= Phrase.find(self.myownphrasesandwords2[@i]) 
         rescue 
	phrase=Phrase.new(content: self.contentmyownphrasesandwords2[@i]) rescue Phrase.new
         end

          w=self.contentmyownphrasesandwords2[@i].strip.squish rescue ""

          @rec1=Recording.new(name: self.recordmyphrasesandwords2[@i], content: (w.length > 0 ? w : phrase.content))
        begin
	phrase= Phrase.find(self.myownphrasesandwords1[@i]) 
         rescue 
	phrase=Phrase.new(content: self.contentmyownphrasesandwords1[@i]) rescue Phrase.new
         end

          w=self.contentmyownphrasesandwords1[@i].strip.squish rescue ""

          @rec2=Recording.new(name: self.recordmyphrasesandwords1[@i], content: (w.length > 0 ? w : phrase.content))



        end

    if self.recordmywords2 && self.recordmywords2.length > 0
        begin
	word = Word.find(self.myownwords2[@i]) 
	rescue 
	word=Word.new(word: self.contentmyownwords2[@i]) rescue Word.new
	end
          paw=self.contentmyownwords2[@i].strip.squish rescue ""

          @rec1=self.surnamerecording.new(name: self.recordmywords2[@i], content: (paw.length > 0 ? paw : word.content))
        end
    if self.recordmywords1 && self.recordmywords1.length > 0
        begin
	word = Word.find(self.myownwords1[@i]) 
	rescue 
	word=Word.new(word: self.contentmyownwords1[@i]) rescue Word.new
	end
          paw=self.contentmyownwords1[@i].strip.squish rescue ""

          @rec2=self.surnamerecording.new(name: self.recordmywords1[@i], content: (paw.length > 0 ? paw : word.content))
        end
      

self.sentencerecording=@rec1
self.surnamerecording=@rec2

    

   p "surnames and sentences" 
    p self.sentencerecording
    p self.surnamerecording
  end
  def savelanguageemotion
@recA=self.sentencerecording
@recB=self.surnamerecording
if self.recordingmylanguage && self.recordingmyemotion
@recA.languagesandemotions.new(language_id:self.recordingmylanguage,emotion_id:self.recordingmyemotion)
@recA.save

@recB.languagesandemotions.new(language_id:self.recordingmylanguage,emotion_id:self.recordingmyemotion)
@recB.save

end
  end

  
  accepts_nested_attributes_for :surname
  accepts_nested_attributes_for :realname
  accepts_nested_attributes_for :avatar
  accepts_nested_attributes_for :destinataire
  accepts_nested_attributes_for :surnamedestinataire
  accepts_nested_attributes_for :thing

   has_many :posts_surnames
   has_and_belongs_to_many :people_hacked, class_name:'Person'
  accepts_nested_attributes_for :posts_surnames
  alias_attribute :people, :people_hacked
  has_many :usurpations, class_name: 'Person', through: :post
  def mycountry
    ps=self
    (ps.person||ps.avatar).country.name.titleize
  end
  def myname
    ps=self
    (ps.surname ? ps.surname.name : (ps.person ? ps.person.name : (ps.avatar ? ps.avatar.name : ""))).titleize
  end
  def mondestinataire=(recipient)
    @destinataire=recipient
  end
  def linksurnames
    "/posts_surnames/"+self.id.to_s
  end
  def fakename=(yesno)
    write_attribute(:fakename,yesno)
  end
  def thingname
    self.thing.name.titleize
  end
  def surnamename
    surname ? self.surname.name.to_s.titleize : ""
  end
  def manysurnames
    self.surname.name
  end
  def linkseries
    "/things/"+self.thing.id.to_s
  end
  def titlelinkseries
    self.thing.name
  end

  def people_hacked_pic
    #pic=self.people_hacked[id.to_i] 
    #pic && pic.image && pic.image.length > 0 ? pic.image : nil
    #nil
  end
  def self.profilepics
  left_joins(:profilepics).select('profilepictures.*')
end

  def image
#    ps = self.person ? self.person.read_attribute(:image) : nil
#    sn=self.surname ? self.surname.image : nil 
#    pl=self.place  ? self.place.image : nil 
#    th=self.thing  ? self.thing.image : nil 
#    post=Post.find(self.post_id)
#      surnames = post.posts_surnames.index(self)
#      mouss=post.moussaillonsdecepost
#      ind=mouss[surnames]||mouss.last
#       pl||ps || th ||sn ||  ind.image
     person=Person.find(self.person_id)
     person.image
rescue ActiveRecord::RecordNotFound
  read_attribute(:image)
  end
  def surname_has_image?
    self.surname.image
  end
  def rootsurnames
    self.post.posts_surnames.where(posts_surname_id: nil)

  end
  def othersurnames
    self.post.posts_surnames.where.not(posts_surname_id: nil)

  end
  def name
    sn=self.surname
    pl=self.place
    th=self.thing
    ps=self.person
    if sn
      sn.name
    elsif pl
      pl.name
    elsif th
      th.name
    elsif ps
      ps.name 
    end
  end


  def whois #leprecedent
    i=self.posts_surname
    all=self.rootsurnames
    allother =self.othersurnames
    ind=all.index(self).to_i-1
    new=all[ind]
    self.posts_surname || (self.post.moussaillonsdecepost.count > 0 ? self.post.moussaillonsdecepost : all.first) ||allother.last || all.last|| self.post

  end
  def nbsailors
    self.post.moussaillonsdecepost.count
  end
  def whois2 #leprecedent
    i=self.posts_surname
    all=self.rootsurnames
    allother =self.othersurnames
    ind=all.index(self).to_i-1
    new=all[ind]
    #self.posts_surname || '/posts/'+self.post.id.to_s+'/allsailors' || self.post
    self.posts_surname ? [self.posts_surname] : self.post.moussaillonsdecepost

  end
  def sailor_ids=(ids)
    if self.post
      ids.split(',').each do |id|
          self.post.posts_surnames.find_or_create_by(self.as_json.merge(sailor_id:id))
      rescue ActiveRecord::RecordNotUnique
          next
      end
    end
  end
    def sailor_ids
        self.post.moussaillonsdecepost
    end

  def lastpost
    
  s=self.post.posts_surnames.to_a
  i=s.index(self)
  d=nil
  if s[0]==self || i==1
      d||= self.post
    elsif self.posts_surname
  d ||= self.posts_surname
      elsif self.posts_surnames.first

  d ||=self.posts_surnames.first
  
  end
  d
  end
  def photoprofilactuelle
    
  end
  def updatemyphoto
    p profilepic_id
    if !profilepic_id
    gal=person||avatar
    pic=gal.myprofilepic_id
    image=gal.myprofilepic ? gal.myprofilepic.read_attribute(:name) : gal.read_attribute(:image)
                                                             
    gal.update(myprofilepic_id: nil)
    write_attribute(:profilepic_id, pic)
    gal.update(:image => image)

    save
    end
  end
  def updatephotoprofilactuelle
    gal=person||avatar||destinataire
    if gal
      pic=gal.myprofilepic_id

      mypic =!pic ? Profilepicture.find_or_create_by(name: gal.read_attribute(:image)) : nil
      if mypic && (!mypic.nameimage || mypic.nameimage == "")
        
        mypic.update(nameimage: gal.name)
      end
      pic ||= mypic.id
        #Profilepicture.find_or_create_by(nameimage: gal.name, name: gal.read_attribute(:image)).id
    end
    image=gal.myprofilepic ? gal.myprofilepic.read_attribute(:name) : gal.read_attribute(:image)
    gal.update(myprofilepic_id: nil)
    if pic
    write_attribute(:profilepic_id, pic)
    end
    if image
    gal.update(:image => image)
    end

    save
  end
  def photoprofilactuelle=(picid)
    pic=Person.find(picid).myprofilepic_id
    write_attribute(:profilepic_id, pic)
  rescue ActiveRecord::RecordNotFound
  end
end
