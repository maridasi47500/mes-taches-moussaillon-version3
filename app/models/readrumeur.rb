class Readrumeur < ApplicationRecord
belongs_to :gossip, class_name: 'Aboutsomeonegossip'
belongs_to :user
validates_uniqueness_of :gossip_id, scope: :user_id

end
