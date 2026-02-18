class Mysentence < ApplicationRecord
before_validation :mydata
has_many :aboutsomethings
accepts_nested_attributes_for :aboutsomethings
translates :content
attr_accessor :cherchersurnames,:cherchertrucs
has_many :aboutsomeones
accepts_nested_attributes_for :aboutsomeones
has_many :mysentenceshrecordings
has_many :recordings, through: :mysentenceshrecordings

accepts_nested_attributes_for :recordings, :reject_if => :all_blank, :allow_destroy => true
before_validation :myrec
def myrec
self.recordings.each do |rec|
files=rec.recordings.to_a
p files
if files.length > 0
p "best recording"
p rec.best
p(self.recordings)
  myrecordings=[]
  files.each_with_index do |file,i|
      pathfile = file.tempfile.path
      filename =pathfile.split('/').last
      #myrecordings.push({name: filename})
      if i == rec.best.to_i
    `mv #{pathfile} #{Rails.root.to_s+"/app/assets/recordings/#{filename}"}`
  rec.write_attribute("name_#{I18n.locale}","/assets/"+filename)
  end
  end

end

end
end
def myinfo
(aboutsomethings.to_a+recordings.myids.to_a+aboutsomeones.to_a).sort_by{|h|h.myid}
end
    def my_name_parts
   @myname1=self.content
    @myonlyname=@myname1.split('')
    @myonlystr = 'MyOnlyKeyWord'
@o = 0
@n="(AUDIO 0)"
       while @myname1.include?(@n) do
     @n.length.times do
@myonlyname.delete_at(@myname1.index(@n) || @myonlyname.length)
p @myonlyname
        end
@myonlyname.insert(@myname1.index(@n),@myonlystr)
    @myname1=@myonlyname.join('')
    p @myname1
    @myonlyname=@myname1.split('')

    p @myonlyname
	@o+=1
@n="(AUDIO #{@o})"
    end
things=Thing.all.where.not(name_fr:[nil,""]).map do |h|
h.name=h.name.upcase
h
end
surname=Dupontsurname.all.map do |h|
h.name=h.name.upcase
h
end
(things+surname).sort_by{|h|h.name.length}.reverse.each do |nn|
n=nn.name
       while @myname1.include?(n) do
     n.length.times do
@myonlyname.delete_at(@myname1.index(n) || @myonlyname.length)
p @myonlyname
        end
@myonlyname.insert(@myname1.index(n),@myonlystr)
    @myname1=@myonlyname.join('')
    p @myname1
    @myonlyname=@myname1.split('')

    p @myonlyname
    end
    end
      @myname1.split(@myonlystr)#.select{|g|g.to_s.strip.squish != ""}
  end
def mydata
nthings=0
npeople=0
npplthing=0
if self.content_fr != self.content_fr_was
myname=self.content_fr
   @myname1=myname
    @myonlyname=@myname1.split('')
    @myonlystr = 'MyOnlyKeyWord'
@o = 0
@n="(AUDIO 0)"
       while @myname1.include?(@n) do
p @myname1+" include "+@n
     @n.length.times do
@myonlyname.delete_at(@myname1.index(@n) || @myonlyname.length)
p @myonlyname
        end
@myonlyname.insert(@myname1.index(@n),@myonlystr)
    @myname1=@myonlyname.join('')
    p @myname1
    @myonlyname=@myname1.split('')

    p @myonlyname
p "chercher mon recording"
p @o
p self.recordings[@o]
if !self.recordings[@o]
self.recordings << Recording.new
self.mysentenceshrecordings[@o].myid=npplthing
end
	@o+=1
	npplthing+=1
@n="(AUDIO #{@o})"
p @n
    end
things=Thing.all.where.not(name_fr:[nil,""]).map do |h|
h.name=h.name.upcase
h
end
surname=Dupontsurname.all.map do |h|
h.name=h.name.upcase
h
end
(things+surname).sort_by{|h|h.name.length}.reverse.each do |nn|
n=nn.name

       while @myname1.include?(n) do
     n.length.times do
@myonlyname.delete_at(@myname1.index(n) || @myonlyname.length)
p @myonlyname

        end
if nn.is_a?(Dupontsurname)
if !self.aboutsomeones[npeople]
self.aboutsomeones.new(name_fr: n,myid:npplthing)
end
npeople+=1
npplthing+=1
end
if nn.is_a?(Thing)
if !self.aboutsomethings[nthings]
self.aboutsomethings.new(name_fr: n,myid:npplthing)
end
self.aboutsomethings[nthings].thing = nn
nthings+=1
npplthing+=1
end
@myonlyname.insert(@myname1.index(n),@myonlystr)
    @myname1=@myonlyname.join('')
    p @myname1
    @myonlyname=@myname1.split('')

    p @myonlyname
    end
    end
      @myname1.split(@myonlystr)
p "bvgyujnbvgyuj"
end


end
def name_parts(myname)


  end

end
