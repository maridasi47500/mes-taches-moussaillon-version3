class Familylink < Parentlink
has_many :linkfamilypeople
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
def image
read_attribute(:image)
end
def self.cousin
Familylink.find_by(name_de: "Cousin")
end
def self.createcousin(people)
  linkoffamily=Familylink.cousin.id
  soeur=Familylink.brosis.id
  people.select {|x|x != ""}.each do |a,b|
    @h=Linkfamilyperson.twopersonlink.where(['familylink_id = ? and ((t.person_id = ? and t.otherperson_id = ?) or (t.otherperson_id = ? and t.person_id = ?))',linkoffamily, a,b,a,b])
    @soeur=Linkfamilyperson.twopersonlink.where(['familylink_id = ? and ((t.person_id = ? and t.otherperson_id = ?) or (t.otherperson_id = ? and t.person_id = ?))',soeur, a,b,a,b])
    if @h.length == 0 && @soeur.length == 0
      @g=Linkfamilyperson.create(familylink_id: linkoffamily, twoperson: Twoperson.find_or_initialize_by(person_id: a, otherperson_id: b))
    else 
      @g=@h[0]
    end
  end
  @g
end
def self.brosis
Familylink.find_by(name_de: "Geschwister")
end

def self.createbrosis(people)
  linkoffamily=Familylink.brosis.id
    cousin=Familylink.cousin.id

  people.select {|x|x != ""}.each do |a,b|
    @cousin=Linkfamilyperson.twopersonlink.where(['familylink_id = ? and ((t.person_id = ? and t.otherperson_id = ?) or (t.otherperson_id = ? and t.person_id = ?))',cousin, a,b,a,b])

    @h=Linkfamilyperson.twopersonlink.where(['familylink_id = ? and ((t.person_id = ? and t.otherperson_id = ?) or (t.otherperson_id = ? and t.person_id = ?))',linkoffamily, a,b,a,b])
    if @h.length == 0 && @cousin.length == 0
      @g=Linkfamilyperson.create(familylink_id: linkoffamily, twoperson: Twoperson.find_or_initialize_by(person_id: a, otherperson_id: b))
    else 
      @g=@h[0]
    end
  end
  @g
end

def self.findbyid(i)
where(id: i)
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n1=I18n.transliterate(n1)
    where('lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?',n1,n1,n1)
    else
    []
    end
  end

end
