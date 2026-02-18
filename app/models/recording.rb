class Recording < ApplicationRecord
  #translates :content
  #translates :name
attr_accessor :best
has_many :mysentenceshrecordings
accepts_nested_attributes_for :mysentenceshrecordings
has_many :mysentences, through: :mysentenceshrecordings
def self.myids
select("recordings.*,mysentenceshrecordings.myid as myid").joins(:mysentenceshrecordings)
end
before_save :myrec
attr_accessor :recordings
def myrec
files=self.recordings.to_a
p files
if files.length > 0
p "best recording"
p self.best
  myrecordings=[]
  files.each_with_index do |file,i|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      #myrecordings.push({name: filename})
      if i == self.best.to_i
    `mv #{pathfile} #{Rails.root.to_s+"/app/assets/recordings/#{filename}"}`
  write_attribute("name_#{I18n.locale}","/assets/"+filename)
  end
  end

end
end
  has_and_belongs_to_many :posts
has_many :languagesandemotions, class_name: 'LangueRecording', foreign_key:'recording_id'
  has_and_belongs_to_many :authors, class_name: "User"
  attr_accessor :myrelationtoselect
  def self.findbyid(n)
    where(id: n)
  end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where(['lower(name_fr) like ? or lower(name_de) like ? or lower(name_en) like ? or lower(content_fr) like ? or lower(content_en) like ? or lower(content_de) like ?',n1,n1,n1,n1,n1,n1])
    else
    []
    end
  end


def recordedphrase
self
end
def recordedword
self
end
def name
    self.read_attribute("name_#{I18n.locale.to_s}")

end
def content
    self.read_attribute("content_#{I18n.locale.to_s}")

end
def content=(cont)
    self.write_attribute("content_#{I18n.locale.to_s}",cont)

end
def name=(file)
  if !file.is_a?(String)
      pathfile = file.tempfile.path
    filename =file.original_filename
    namefile="#{(rand()*100000000).to_i}.#{filename.split('.')[1]}"
      loc='jingles'
#abs="/app/assets/#{loc}/"+namefile
#p abs
    #image =Post.cloud([loc,filename].join('/'),pathfile)
    #if image
    #self.write_attribute(:name,image)
    #else
      File.open(Rails.root.join('app/assets', 'jingles', filename), 'w') do |f| 
	f.write(file.read.force_encoding('UTF-8'))
      end
    self.write_attribute("name_#{I18n.locale.to_s}",filename)

    #end
  else
        self.write_attribute("name_#{I18n.locale.to_s}",file)

    end
end

end
