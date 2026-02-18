class Invite < ApplicationRecord
has_many :invitehavetasks
has_many :tasks, through: :invitehavetasks
has_and_belongs_to_many :people, :join_table => :invitehavepeople
has_many :answermessages
def self.grouppeoplefamily
mypeople=Invite.all.joins(:people).select('people.id').pluck('people.id')
p mypeople
invit={}
combi=Linkfamilyperson.all.map{|x|[x.person_id, x.otherperson_id]}
mypeople.each do |j|
invit[j] = Person.findbyid(combi.select{|x| x.include?(j)}.flatten)
combi = combi - invit[j]
end
invit.to_a

end
def guestmostlyfemale
peoplecount=Hash.new(0)
people.each {|p|peoplecount[p] += 1}
peoplecount.sort_by {|p,n| n}.last[0]
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
def connected(uid)
self.people.joins('left join aliases a on a.person_id = people.id').select('a.*, people.*').where('a.user_id' => uid).to_a
end

end
