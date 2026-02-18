class Taskaction < ApplicationRecord

has_many :sailorandactions, foreign_key: 'action_id'
has_many :people, through: :sailorandactions
has_many :actionshavethingsbyhearts
has_many :categorythings, through: :actionshavethingsbyhearts
has_many :taskactionsailorjobs
has_many :sailorjobs, through: :taskactionsailorjobs
  has_many :actionssailorgrouptasks
  has_many :sailorgrouptasks, through: :actionssailorgrouptasks, autosave: true

accepts_nested_attributes_for :sailorjobs
attr_accessor :myredirect,:person_id,:grouptask_id,:task_id
before_validation :myvalidation
def myvalidation
if person_id
k=self.taskactionsailorjobs.find_or_create_by(sailorjob: Sailorjob.find_or_create_by(person_id: person_id,task_id: task_id))
k.people << Person.find(person_id)
l=Grouptask.find(grouptask_id)
ll=l.sailorgrouptasks.find_or_create_by(person_id: Person.find(person_id))
self.sailorgrouptasks << ll
self.myredirect="/tasks/#{task_id}/grouptask/#{grouptask_id}/#{person_id}"
end 
end
def image=(file)
    if file.is_a?(String)
    self.write_attribute(:image,file)
  else

      pathfile = file.tempfile.path
    filename =file.original_filename
      loc='photos'
abs="/app/assets/images/"+filename
p abs
File.open(Rails.root.join('app/assets', 'images', file.original_filename), 'wb') do |f|
  f.write(file.read)
end
write_attribute(:image,file.original_filename)

    end
end
def image
read_attribute(:image)
end
translates :name
self.table_name = "actions"
has_many :taskshaveactions
def self.taskdifferetactions
joins('left join taskshaveactions att on att.action_id = actions.id').joins('left join tasks mytasks on att.task_id = mytasks.id').select('att.*, actions.*,mytasks.*,mytasks.name as taskname,mytasks.id as taskid, actions.name_'+I18n.locale.to_s+' as taskactionname').joins('left join thistasknotthistasks h on h.task_id = mytasks.id or h.othertask_id = mytasks.id').having('h.id is not null').group('actions.id').select('h.*').group_by {|x| x.taskactionname}.to_a.combination(2).to_a
end

def self.findbyid(i)
where(id: i)
end
  def self.findbyname(n)
    if n.to_s.length > 0
    n1="%#{n.to_s.downcase.gsub(' ','%')}%"
    n2=I18n.transliterate(n1)
    where('lower(name_en) like ? or lower(name_fr) like ? or lower(name_de) like ?',n1,n1,n1)
    else
    []
    end
  end

end
