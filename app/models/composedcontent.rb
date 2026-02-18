class Composedcontent < Content
   has_and_belongs_to_many :refrains, :join_table => :refrainhavecomposedcontents
   has_and_belongs_to_many :couplets, :join_table => :couplethavecomposedcontents
    def self.ok(contentid,userid)
   content=Content.find(contentid)
   contents=content && content.refrains[0] ? Composedcontent.joins('left join refrainhavecomposedcontents j on j.composedcontent_id = contents.id').joins('left join contents refrain on refrain.id = j.refrain_id').select('j.*, contents.*, refrain.*').where('j.refrain_id' => content.refrains[0].id,'contents.lineid' => content.lineid,'j.user_id' => userid).select('contents.*') : nil
   contents && contents.length > 0 ? contents : Composedcontent.new(lineid: content.lineid)
 end


end
