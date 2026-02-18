class Commentrumeur < ApplicationRecord
belongs_to :gossip, class_name: 'Aboutsomeonegossip'
belongs_to :user
end
