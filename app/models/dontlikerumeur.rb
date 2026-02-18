class Dontlikerumeur < ApplicationRecord
belongs_to :gossip, class_name: 'Aboutsomeonegossip'
belongs_to :user
validates_uniqueness_of :gossip_id, scope: :user_id
after_validation :like
def like
Likerumeur.where(user_id: self.user_id, gossip_id: self.gossip_id).destroy_all
end

end
