class Findthemostlgbt < ApplicationRecord
belongs_to :betterperson
belongs_to :alias
validates_uniqueness_of :betterperson_id, scope: :alias_id
end

