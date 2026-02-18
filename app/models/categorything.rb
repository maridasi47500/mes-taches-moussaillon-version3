class Categorything < Thing
has_many :taskusedstuffs, foreign_key: 'thing_id'

def thingsisaid(userid)
taskusedstuffs.where(user_id: userid)

end

def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end

end
