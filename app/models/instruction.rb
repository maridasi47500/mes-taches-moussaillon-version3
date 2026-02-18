class Instruction < ApplicationRecord
has_and_belongs_to_many :aliases, :join_table => :instructionshavepeople
translates :content
belongs_to :otherinstruction, class_name: 'Instruction',optional: true
has_one :myinstruction,foreign_key:"otherinstruction_id", class_name: 'Instruction'
accepts_nested_attributes_for :otherinstruction, allow_destroy: true
def self.endinstruction
where(otherinstruction: nil)
end
def firstinstruction
k = myinstruction || self
while k && k.myinstruction
k=k.myinstruction
end
k
end
        def self.findbyid(o)
                where("id"=>o)
        end
        def self.findbyname(n)
              o='%'+n.to_s.gsub(' ','%').downcase+'%'
                where(["lower(content_fr) like ? or lower(content_de) like ? or lower(content_en) like ?",o,o,o]).select('instructions.*,content_'+I18n.locale.to_s+' as name')
        end

end
