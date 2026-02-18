class Sailorjob < ApplicationRecord
has_many :sailorjobhaveratings
  belongs_to :task
  belongs_to :sailor, class_name: 'Person', foreign_key: 'person_id'
  validates_uniqueness_of :task_id, :scope => :person_id
has_many :taskactionsailorjobs
has_many :taskactions, through: :taskactionsailorjobs
accepts_nested_attributes_for :taskactions
has_many :sailorjobhaveclothes
has_many :clothes, through: :sailorjobhaveclothes
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        joins('left join people p on sailorjobs.person_id = p.id').joins('left join tasks t on t.id = sailorjobs.task_id').where(["lower(t.name_en) like ? or lower(t.name_fr) like ? or lower(t.name_de) like ? or lower(p.name) like ? or lower(p.firstnames) like ? or lower(p.lastname) like ?",o,o,o,o,o,o]).select('p.*,t.*,sailorjobs.*').group('sailorjobs.id')


end
def self.findbyid(i)
where(id: i)
end

end

