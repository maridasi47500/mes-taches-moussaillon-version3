class ReactionsText < ApplicationRecord
  attr_accessor :cherchersurnames
has_many :reactions, foreign_key: "reaction_id"
translates :name
    def mynbpeople
    self.name ? Reaction.mykeywords.map {|x|self.name.each_char.each_cons(x.size).map(&:join).count(x)}.sum : nil


  end
    def namesinit
   @myname1=self.name

    @myonlyname=@myname1.split('')
    @mylist=[]
    @myonlystr = 'MyOnlyKeyWord'
    p Reaction.mykeywords.sort_by{|h|h.length}.reverse
    Reaction.mykeywords.sort_by{|h|h.length}.reverse.select do |y|
while @myname1.include?(y) do
        y.length.times do
@myonlyname.delete_at(@myname1.index(y) || @myonlyname.length)
p @myonlyname
        end
    @myname1=@myonlyname.join('')
    p @myname1
    @myonlyname=@myname1.split('')
@mylist.push(y)
end
     end
     @mylist
      end

    def name_parts
   @myname1=self.name
    @myonlyname=@myname1.split('')
    @myonlystr = 'MyOnlyKeyWord'
    Reaction.mykeywords.sort_by{|h|h.length}.reverse.each do |n|
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
      @myname1.split(@myonlystr)
Dupontsurname.all.pluck(:name).map{|x|x.upcase}
  end

def self.findbyname(n)
n1="%#{n.downcase.gsub(' ','%')}%"
where(["lower(name_fr) like ? or lower(name_en) like ? or lower(name_de) like ?",n1,n1,n1]) 
end
def self.nbpages
(all.length / 10).to_i
end
def self.bypage(i)
all.limit(10).offset(i.to_i * 10)
end

end
