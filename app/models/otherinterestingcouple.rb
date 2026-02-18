class Otherinterestingcouple < ApplicationRecord
belongs_to :linkspouseperson
belongs_to :otherlinkspouseperson, class_name: "Linkspouseperson"
validates_uniqueness_of :linkspouseperson_id, scope: :otherlinkspouseperson_id
end
