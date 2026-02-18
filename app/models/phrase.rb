class Phrase < ApplicationRecord
translates :content
    before_validation :setcreation, on: :create
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i * 10)
end
def content
    self.read_attribute("content_#{I18n.locale.to_s}")

end
def content=(cont)
    self.write_attribute("content_#{I18n.locale.to_s}",cont)

end


 
  def self.findbyid(n)
where(id: n)
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    #n1=I18n.transliterate(n1)
    where('lower(content_fr) like ? or lower(content_en) like ? or lower(content_de) like ?',n1,n1,n1)
    else
    []
    end
  end

  def gf
    lg="girlfriend".split("")
    cont=[content_en.to_s.downcase, content_fr.to_s.downcase, content_de.to_s.downcase]
    lg.all? {|x|cont.any? {|y|y.include?(x)}}
  end
  def lsb
    lg="lesbian".split("")
    cont=[content_en.to_s.downcase, content_fr.to_s.downcase, content_de.to_s.downcase]
    lg.all? {|x|cont.any? {|y|y.include?(x)}}
  end
  def lg
    lg=['l','g','b','t']
    cont=[content_en.to_s.downcase, content_fr.to_s.downcase, content_de.to_s.downcase]
    lg.all? {|x|cont.any? {|y|y.include?(x)}}
  end
  private
  def setcreation
    self.created=DateTime.now
  end
end
