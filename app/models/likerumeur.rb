class Likerumeur < ApplicationRecord
belongs_to :gossip, class_name: 'Aboutsomeonegossip'
belongs_to :user
validates_uniqueness_of "gossip_id", :scope => "user_id"
after_validation :like
def like
Dontlikerumeur.where(user_id: self.user_id, gossip_id: self.gossip_id).delete_all
end


end
