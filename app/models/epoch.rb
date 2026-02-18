class Epoch < Task
has_many :factoriesservicehaveemployeeepochs
has_many :factoriesservicehaveemployees, through: :factoriesservicehaveemployeeepochs
has_many :epochstudents
has_many :people, through: :epochstudents
has_many :taskhaveepochs
has_many :tasks, through: :taskhaveepochs
has_many :peoplecitiesepochs
has_many :people_cities, through: :peoplecitiesepochs
has_many :cities, through: :people_cities
has_and_belongs_to_many :peoplehavejobs, :join_table => :peoplehavejobhaveepochs


accepts_nested_attributes_for :epochstudents, allow_destroy: true
def people_citiesnot(person,city)
people_cities.where.not(['person_id = ? and city_id = ?', person.id,city.id])
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
def self.tasksameepoch
joins('left join taskhaveepochs on taskhaveepochs.epoch_id = tasks.id').joins('left join tasks mytasks on taskhaveepochs.task_id = mytasks.id').select('taskhaveepochs.*, tasks.*,mytasks.*,mytasks.name_'+I18n.locale.to_s+' as taskname,mytasks.name_en as tasknameen,mytasks.name_fr as tasknamefr, mytasks.name_de as tasknamede,mytasks.id as taskid, tasks.name_'+I18n.locale.to_s+' as epochname').group_by {|x|x.taskname}.to_a
end
def nomdecetteepoque
self.start_at.strftime("#{self.city.name}, %Y")
end
        def self.findbyid(o)
                where("id"=>o)
        end
        def self.findbyname(n)
              o='%'+n.to_s.gsub(' ','%').downcase+'%'
                joins(:city).select('cities.*,tasks.*,tasks.id').where(["cities.name like ? or tasks.start_at like ? or lower(tasks.name_en) like ? or lower(tasks.name_fr) like ? or lower(tasks.name_de) like ?"]+Array.new(5,o))
        end

end
