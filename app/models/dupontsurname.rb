class Dupontsurname < ApplicationRecord
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        #where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
        where(["lower(name) like ?",o])
end

end
