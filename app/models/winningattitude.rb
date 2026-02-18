class Winningattitude < ApplicationRecord
def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(content_en) like ? or lower(content_fr) like ? or lower(content_de) like ?",o,o,o])
end

translates :content
has_many :winningattitudespeople
has_many :people, through: :winningattitudespeople

end
