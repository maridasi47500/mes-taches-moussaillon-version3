class Githubaccount < ApplicationRecord
belongs_to :owner, foreign_key: 'owner_id', class_name: 'Person', optional: true
def accounturl
"https://www.github.com/#{username}"
end
def name
if self.persisted?
read_attribute(:username).to_s+" de "+nameowner.to_s
else
""
end
end

def self.findbyid(n)
where("id" => n)
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        left_joins(:owner).where(["lower(people.name) like ? or lower(githubaccounts.username) like ? or lower(githubaccounts.nameowner) like ?",o,o,o]).select("githubaccounts.*,(people.name || githubaccounts.username || githubaccounts.nameowner) as name")
end


end
