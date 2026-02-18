class Peoplebuyclothing < ApplicationRecord
belongs_to :alias
belongs_to :clothing
validates_uniqueness_of :alias_id, scope: :clothing_id
def name
self.alias.alias.name+" ("+self.alias.user.name+") - "+self.clothing.name
end
def self.findbyname(n)
      o='%'+n.gsub(' ','%').downcase+'%'
        joins('left join aliases a on a.id = peoplebuyclothes.alias_id').joins('left join people sailors on sailors.id = a.person_id').joins('left join things tt on tt.id = peoplebuyclothes.clothing_id').where(["lower(tt.name_en) like ? or lower(tt.name_fr) like ? or lower(tt.name_de) like ? or lower(sailors.name) like ? or lower(sailors.firstnames) like ? or lower(sailors.lastname) like ?",o,o,o,o,o,o]).select('a.*,sailors.*,tt.*,peoplebuyclothes.*,(sailors.name||" '+I18n.t('connectwords.et')+' "||tt.name_'+I18n.locale.to_s+') as sailorsname').group('peoplebuyclothes.id')

end
def self.findbyid(x)
where(id: x)
end

end
