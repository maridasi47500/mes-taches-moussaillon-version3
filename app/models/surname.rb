class Surname < ApplicationRecord
has_many :internetpseudonyms
has_many :websites, through: :internetpseudonyms
has_and_belongs_to_many :nationalities, :join_table => :surnameshavenationalities
has_and_belongs_to_many :schools, :join_table => :surnameshaveschools
has_many :surnamehavepeople
has_many :people, through: :surnamehavepeople
  attr_accessor :new_surname
before_validation :savesurname 
  def savesurname
    # Find or create the author by name
    if !name && new_surname
       self.name = new_surname
    elsif name && new_surname
       self.name = new_surname
    end
  end

def self.nbpages
all.length / 10
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where('lower(name) like ?',n1)
    else
    []
    end
  end

def self.bypage(i)
all.limit(10).offset(i.to_i * 10)
end


  has_one :posts_surname
  belongs_to :meaning, foreign_key: "interpretation_id", class_name: "Meaningsforsurname", optional: true
def self.findbyid(n)
where(id: n)
end
def self.find_by_id(n)
where(id: n)
end
def self.find_by_name(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where("lower(name) like ?",o)
end

  def my_relation
  image=self.read_attribute(:my_relation)
  image.to_s.length > 0 ? image : nil
  end
  def my_relation_surname
  my_relation && my_relation.to_s.length > 0 ? my_relation : "comme si il-elle était"

  end
  def my_relation=(myrel)
  write_attribute(:my_relation,myrel)
  end
  def name
  image=self.read_attribute(:name)
  image.to_s.length > 0 ? image : nil
  end
   def image
  self.read_attribute(:image)
  #image || ""
    #image = self.person.read_attribute(:image)
  #    post=self.posts_surname.post
  #    surnames = post ? Surname.joins(:posts_surname).where(posts_surname: post.posts_surnames).index(self) : nil
  #          mouss=post ? post.moussaillonsdecepost : nil
  #    ind=surnames ? (mouss[surnames]||mouss.last) : nil
  #    indimage = ind ? ind.image : nil
  #    imagepostsurname = self.posts_surname.person ? self.posts_surname.person.image : self.posts_surname.image
  #    image




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

end
