class Displaygossip < ApplicationRecord
  #belongs_to :gossip, foreign_key: "Gossipid", class_name: "Aboutsomeonegossip"
  
  belongs_to :post, foreign_key: 'Postid', class_name: 'Post', optional: true
end

