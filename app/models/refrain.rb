class Refrain < Paragraph
 has_and_belongs_to_many :contents, :join_table => :refrainshaverefrains
 accepts_nested_attributes_for :contents, allow_destroy: true
 has_many :refrainhavecomposedcontents
       accepts_nested_attributes_for :refrainhavecomposedcontents

 has_many :composedcontents, :through => :refrainhavecomposedcontents
   has_and_belongs_to_many :songs, :join_table => :songshaverefrain

 accepts_nested_attributes_for :composedcontents, allow_destroy: true
 attr_accessor :userid
   before_save :setuserid
 def self.ok(contentid,userid)
   content=Content.find(contentid)
   contents=content && content.refrains[0] ? Composedcontent.joins('left join refrainhavecomposedcontents j on j.composedcontent_id = contents.id').joins('left join contents refrain on refrain.id = j.refrain_id').select('contents.*,j.* ').where('j.refrain_id' => content.refrains[0].id,'contents.lineid' => content.lineid,'j.user_id' => userid) : nil
   contents && contents.length > 0 ? contents : Composedcontent.new(lineid: content.lineid)
 end
 def self.ok2(contentid,userid)
   Content.where(id: contentid)
 end
 private
 def setuserid
   self.refrainhavecomposedcontents.each do |t|
     t.user_id = self.userid
   end
   p self.refrainhavecomposedcontents

 end

end
