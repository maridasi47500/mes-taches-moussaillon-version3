class Dontunderstandgossip < ApplicationRecord
belongs_to :gossip
belongs_to :user
validates_uniqueness_of :gossip_id, scope: :user_id
after_validation :entendu
def entendu
Heardrumeur.where(gossip: self.gossip, user: self.user).delete_all
end

end
