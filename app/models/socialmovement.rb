class Socialmovement < Thing
        def self.findbyid(o)
                where("id"=>o)
        end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n2=I18n.transliterate(n1)
    str1='lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?'
    where([str1+' or '+str1]+Array.new(3,n1)+Array.new(3,n2))
    else
    []
    end
  end

  
end
