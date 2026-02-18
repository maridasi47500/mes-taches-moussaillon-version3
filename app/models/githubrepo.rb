class Githubrepo < ApplicationRecord
has_and_belongs_to_many :places, :join_table => :githubreposhaveplaces
has_and_belongs_to_many :programminglanguages, :join_table => :githubreposhaveprogramminglanguages
belongs_to :githubaccount
def self.findbyid(n)
where("id" => n)
end
def url
"https://www.github.com/#{githubaccount.username}/#{self.reponame}"
end
def name
if self.persisted?
read_attribute(:reponame).to_s+" chez "+githubaccount.username
else
""
end
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'

        joins(:githubaccount).where(["lower(githubrepos.reponame) like ? or lower(githubaccounts.username) like ? or lower(githubaccounts.nameowner) like ?",o,o,o]).select('githubaccounts.*, githubrepos.*, (githubrepos.reponame || \' chez \' || githubaccounts.username) as name')
end

end
