class Peoplehavejob < ApplicationRecord
belongs_to :person
belongs_to :job
validates_uniqueness_of :person_id, scope: :job_id
def self.findbyname(x)
nn='%'+x.downcase.gsub(' ','%')+'%'
joins(:person,:job).select("people.*, jobs.*, peoplehavejobs.*").where(["lower(people.name) like ? or lower(jobs.name_fr) like ? or lower(jobs.name_en) like ? or lower(jobs.name_de) like ?",nn,nn,nn,nn])
end
def self.findbyid(u)
where(id: u)
end
def name
I18n.t('display.peoplehavejob',job: self.job.name,person: self.person.name)
end
end
