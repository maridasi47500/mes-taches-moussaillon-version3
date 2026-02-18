class Album < ApplicationRecord
  #groupes de personnes utilisateurs
#rajouter table issues/Hacking Themes 
#afficher les videos photos recording par 
#events - taches - issues
#albums habtm events
#groups habtm users
attr_accessor :mytitle,:myphotos
belongs_to :person, optional: true
has_many :profilepictures
has_and_belongs_to_many :photos, :join_table => :albumshavephotos
accepts_nested_attributes_for :photos, allow_destroy: true
has_many :sailors, through: :photos, source: :sailors
before_validation :allmyphotos
def allmyphotos
if self.myphotos
self.myphotos.each do |g|
self.photos.new(name: g,title:self.mytitle)
end
end
end
  def name_with_sailor
    t=self.title
    p=self.person ? " avec "+self.person.name : ""
    t+p
  end
  def nameperson
    person ? person.name : ""
  end
end
