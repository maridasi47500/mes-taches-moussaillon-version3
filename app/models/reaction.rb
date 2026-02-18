class MyOtherValidator < ActiveModel::Validator
  def validate(record)
    p record.errors
    if record && record.peoplethatarereacting &&record.nbpeople && record.nbpeople > record.peoplethatarereacting
      record.errors.add :base, "nb people you enter (#{record.peoplethatarereacting}) and number of groups of people (#{record.severalpeoplestories.length}) must be equal to number of people in the text (#{record.nbpeople})"
    end
  end
end

class Reaction < ApplicationRecord
attr_accessor :everypeople
 def namesinit
    self.myownreaction.namesinit
      end
def myreactivepeople
l=reactivepeople.to_a
m=[]
name_parts.each_with_index do |h,ind|
if self.severalpeoplestories.find_by(myid: ind)
m<< self.severalpeoplestories.find_by(myid: ind).posts_surnames
elsif l.length > 0
m<<[l.shift]
end
end
m
end
before_validation :savemysurnames
def savemysurnames
@every=everypeople == "1"
severalpeoplestories.each do |h|
h.posts_surnames.each do  |j|
if j.persisted? && j.new_surname && j.surname
j.surname = Surname.new(name: (@every ? j.person.try(:name) : j.new_surname))
j.save
elsif j.persisted? && j.new_surname
j.surname = Surname.new(name: (@every ? j.person.try(:name) : j.new_surname))
j.save
end
end
end
self.reactivepeople.each do  |j|
if j.persisted? && j.new_surname && j.surname
j.surname = Surname.new(name: (@every ? j.person.try(:name) : j.new_surname))
j.save
elsif j.persisted? && j.new_surname
j.surname = Surname.new(name: (@every ? j.person.try(:name) : j.new_surname))
j.save
end
end
end
has_many :severalpeoplestories, autosave: true
has_many :otherreactingpeople, through: :severalpeoplestories, source: :posts_surnames, autosave: true
has_many :someothersailors, through: :otherreactingpeople, source: :person, autosave: true
has_many :othersailors, through: :otherreactingpeople, source: :sailor, autosave: true
accepts_nested_attributes_for :severalpeoplestories
translates :name
  belongs_to :emotion, optional: true
  belongs_to :speaker, optional: true, foreign_key: "speaker_id", class_name: "PostsSurname"
  has_one :my_surname, through: :speaker, class_name: "Surname", source: :surname
  has_and_belongs_to_many :reactingpeople, class_name: 'Person'
def self.findbyid(x)
where(id: x)
end
def self.findbyname2(n)
self.findbyname(n).to_a.group_by {|x|[x.reactionid,x.sentence]}.to_a.map{|a,b|[a,b.map{|y|y.personname}.to_sentence]}
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        joins('left join posts_surnames_reactions ps on ps.reaction_id = reactions.id').joins('left join posts_surnames pss on pss.id = ps.posts_surname_id').joins('left join people p on p.id = pss.person_id').joins('left join surnames s on s.id = pss.surname_id').joins('left join reactions_texts rt on rt.id = reactions.reaction_id').where('ps.posts_surname_id' => PostsSurname.findthem(o).as_json.pluck('psid')).select('reactions.*,s.*,pss.*, ps.*,p.*,rt.*,(case when p.id is not null then p.name else s.name end) as personname, reactions.id as reactionid,rt.name_'+I18n.locale.to_s+' as sentence')+joins('left join posts_surnames_reactions ps on ps.reaction_id = reactions.id').joins('left join posts_surnames pss on pss.id = ps.posts_surname_id').joins('left join surnames s on s.id = pss.surname_id').joins('left join people p on p.id = pss.person_id').select('reactions.*, s.*,ps.*,pss.*,rt.*,p.*,(case when p.id is not null then p.name else s.name end) as personname, rt.name_'+I18n.locale.to_s+' as sentence,reactions.id as reactionid').joins('left join reactions_texts rt on rt.id = reactions.reaction_id').where(["lower(rt.name) like ? or lower(s.name) like ?",o,o])


end
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i * 10)
end

  belongs_to :myownreaction, foreign_key: "reaction_id", class_name: "ReactionsText"
#tu pourrais utiliser la classe Phrase pour la classe ReactionsText ou tu peux garder comme ca si je veux pas que ca se melange
has_and_belongs_to_many :reactivepeople, class_name: 'PostsSurname', autosave: true
has_many :somepeople, through: :reactivepeople, source: :person
has_many :someotherpeople, through: :reactivepeople, source: :sailor
  has_many :surnames, through: :reactivepeople
  accepts_nested_attributes_for :speaker, allow_destroy: true
  accepts_nested_attributes_for :surnames, allow_destroy: true
  accepts_nested_attributes_for :reactivepeople, allow_destroy: true
  validates_with MyOtherValidator
def self.reactionbyid(n)
where(id: n)
end
def self.mybestreactions(n)
where("lower(name_"+I18n.locale.to_s+") like ?", "%#{n.downcase.gsub(" ","%")}%")
end
  def surname
    s=self.read_attribute(:surname)
    s && s.length > 0 ? s : nil
  end
  def peoplethatarereacting
    p self
    p self.reactivepeople
    self.reactivepeople.length + self.severalpeoplestories.length
  end
  def nbpeople
    self.name ? self.namesinit.length : nil
  end
  def self.notall
    all.last(10)
  end
  def name
     (myownreaction ? myownreaction.name : nil) || read_attribute(:name) 

  end
  def guessreactionid
    reac=ReactionsText.findbyname(self.name)[0]
    reac ? reac.id : nil
  end
  def self.mykeywords
    Dupontsurname.all.pluck(:name).map{|x|x.upcase}
  end
    def name_parts
    self.myownreaction.name_parts
  end
      def afficherceuxlaaussi
somepeople+someotherpeople+(speaker  ? [speaker] : [])
  end
      def afficherceuxla
somepeople+someotherpeople+(speaker  ? [speaker] : [])
  end

def renderreactingpeople
  self.opposite ? self.reactivepeople.reverse.to_a : self.reactivepeople.to_a
end
def groupby
  read_attribute(:group_by) || 1
end
  def self.ofallkind
    ReactionsText.pluck(:name)
    #[ 
    #  "or perhaps PERSON meant",
    #  "or perhaps you meant PERSON",
    #  "what you PERSON about PERSON is untrue",
    #  "i agree with PERSON about PERSON",
    #  "PERSON made an error about PERSON",
    #  "i don't agree with what PERSON says about PERSON",
    #  "PERSON says about PERSON",
    #  "or perhaps PERSON thought otherwise about PERSON"
    #]
  end
end
