class GoogleRequest < ApplicationRecord
  has_and_belongs_to_many :posts, :join_table => :requetegooglesposts, class_name: "Post"
  accepts_nested_attributes_for :posts, allow_destroy: true
  has_and_belongs_to_many :googleresults, :join_table => :googleresultsofgooglerequests
  accepts_nested_attributes_for :googleresults
def self.findbyid(n)
        where("id"=>n)

end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        where(["lower(name) like ?",o])

end

end
