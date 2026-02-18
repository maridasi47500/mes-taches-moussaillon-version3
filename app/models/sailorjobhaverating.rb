class Sailorjobhaverating < ApplicationRecord
validates_presence_of :rating
belongs_to :sailorjob
belongs_to :user
self.table_name="sailorjobhaveratings"
validates_uniqueness_of :sailorjob_id, scope: :user_id
end
