class Jingle < Recording
has_many :jingleshavereactions
has_many :reactions, through: :jingleshavereactions
translates :name
translates :content
has_many :radioshavejingles
has_many :radios, through: :radioshavejingles

has_and_belongs_to_many :tasks, :join_table => :jinglehavetasks
has_many :jinglehavesingers
has_many :people, :through => :jinglehavesingers, source: :person, class_name: 'Person'
has_many :jinglehaveaudiencemembers
has_many :audiencemembers, :through => :jinglehaveaudiencemembers, source: :person, class_name: 'Person'
  has_and_belongs_to_many :posts
  belongs_to :posts_surname, optional: true
  accepts_nested_attributes_for :posts_surname

  has_many :personaljingles, class_name: "Thisisjingle"
  has_many :people, through: :personaljingles, source: :person
  has_one :peoplehackedinjingle, through: :posts_surname, source: :person
def self.mostusedjinglesinposts
  left_joins(:posts).select('posts.*, recordings.*, recordings.id, recordings.name, recordings.content, count(posts.id) as countpost').group('recordings.id').order('countpost' => :desc)
end
def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        joins('left join jinglehavesingers p2 on p2.jingle_id = recordings.id').joins('left join jinglehaveaudiencemembers p1 on p1.jingle_id = recordings.id').joins('left join people pe1 on pe1.id = p1.person_id').joins('left join people pe2 on pe2.id = p2.singer_id').having(["lower(pe1.name) like ? or lower(pe2.name) like ? or lower(recordings.content) like ?"]+Array.new(3, o)).select('recordings.*, pe1.*, pe2.*, recordings.id as recid, pe1.id, p1.person_id,p1.jingle_id, p2.singer_id, recordings.id as jingleid, pe1.name as recipient, pe2.name as sender').group('sender','recipient')
end

def name
  n=read_attribute(:name).to_s
  
  n.length > 0 ? (n.include?('http') ? "" : "/assets/")+n : ""
end
def person
self.people.first
end
  has_many :personwithajingle, through: :personaljingles, class_name: 'Person', source: :person

end
