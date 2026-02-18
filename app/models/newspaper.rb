class Newspaper < Thing
has_and_belongs_to_many :writers, :join_table => :newspaperwriters, class_name: 'Person'
def self.findbyid(h)
where(id: h)
end

def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?",o,o,o])
end

end
