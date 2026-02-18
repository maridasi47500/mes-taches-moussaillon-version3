class Usersjob < ApplicationRecord
belongs_to :user
belongs_to :job
validates_uniqueness_of :user_id,scope: :job_id
has_many :mysectors
has_many :sectors,through: :mysectors
accepts_nested_attributes_for :sectors,allow_destroy: true

end 
