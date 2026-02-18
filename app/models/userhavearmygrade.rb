class Userhavearmygrade < ApplicationRecord
belongs_to :user
belongs_to :armygrade
validates_uniqueness_of :user_id, scope: :armygrade_id
end
