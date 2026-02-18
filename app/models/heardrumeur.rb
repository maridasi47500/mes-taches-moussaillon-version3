class Heardrumeur < ApplicationRecord
belongs_to :gossip, class_name: 'Aboutsomeonegossip'
belongs_to :user
validates_uniqueness_of :gossip_id, scope: :user_id
after_validation :entendu
def entendu
Dontunderstandgossip.where(gossip: self.gossip, user: self.user).destroy_all
end

end
