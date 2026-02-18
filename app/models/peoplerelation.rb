class Peoplerelation < ApplicationRecord
has_many :worktwos, foreign_key: 'link_id'
def self.findbyid(i)
where(id:i)
end
def self.findbyname(n)
if n.strip.squish.length > 0
      o='%'+n.to_s.strip.squish.gsub(' ','%').downcase+'%'
        where("lower(name) like ?",o)
end
end

end
