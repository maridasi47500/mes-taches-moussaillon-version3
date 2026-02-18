class Couplet < Paragraph
    has_and_belongs_to_many :songs, :join_table => :songshavecouplets

  has_and_belongs_to_many :contents, :join_table => :coupletshavecontents
 accepts_nested_attributes_for :contents, allow_destroy: true
 has_many :couplethavecomposedcontents
        accepts_nested_attributes_for :couplethavecomposedcontents

 has_many :composedcontents, :through => :couplethavecomposedcontents
 accepts_nested_attributes_for :composedcontents, allow_destroy: true

 def self.ok2(contentid,userid)
   Content.where(id: contentid)
 end
 def self.ok(contentid,userid)
   content=Content.find(contentid)
   contents=content && content.couplets[0] ? Composedcontent.joins('left join couplethavecomposedcontents j on j.composedcontent_id = contents.id').joins('left join contents couplet on couplet.id = j.couplet_id').select('j.*, contents.*, couplet.*').where('j.couplet_id' => content.couplets[0].id,'contents.lineid' => content.lineid,'j.user_id' => userid) : nil
   contents && contents.length > 0 ? contents : Composedcontent.new(lineid: content.lineid)
 end

end
