class Findthemost < ApplicationRecord
self.table_name="findthemost"
belongs_to :betterperson
belongs_to :user
validates_uniqueness_of :betterperson_id, scope: :user_id
end
