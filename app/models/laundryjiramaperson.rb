class Laundryjiramaperson < ApplicationRecord
belongs_to :alias
has_one :person, through: :alias, source: :alias
belongs_to :grade, class_name: 'Armygrade'
def self.createonesalut(p1,p2,g1,g2,user)
alias1 =Alias.findorcreatefrompersoniduser(p1,user)[0]
alias2 =Alias.findorcreatefrompersoniduser(p2,user)[0]
l1=self.find_or_create_by(alias_id: alias1.id,grade_id: g1)
l2=self.find_or_create_by(alias_id: alias2.id,grade_id: g2)
Salutmilitaire.find_or_create_by(laundryjiramaperson: l1,otherlaundryjiramaperson: l2)

end
        def self.findbyid(o)
                where("id"=>o)
        end
        def self.findbyname(n)
              o='%'+n.to_s.gsub(' ','%').downcase+'%'
                joins('left join aliases a on a.id = laundryjiramapeople.alias_id').joins('left join people p on p.id = a.person_id').joins('left join users u on u.id = a.user_id').joins('left join armygrades g on laundryjiramapeople.grade_id = g.id').where(["lower(g.nom) like ? or lower(p.name) like ? or lower(u.name) like ?"]+Array.new(3,o)).select('laundryjiramapeople.*, g.*,u.*,a.*,p.*,(g.nom || " " ||u.name||" "||p.name) as nomspecial,laundryjiramapeople.id as idspecial,laundryjiramapeople.id')
        end


end
