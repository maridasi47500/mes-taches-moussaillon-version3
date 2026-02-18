class Sailorjobhavealias < ApplicationRecord
has_and_belongs_to_many :othersailorjobhavealiases, :join_table => :sailorjobhavealiasesdialogs, class_name:"Sailorjobhavealias"
belongs_to :sailorjob
belongs_to :user
validates_uniqueness_of :user_id, scope: :sailorjob_id
end
