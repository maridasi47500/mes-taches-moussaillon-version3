class Reactionimage < ApplicationRecord
belongs_to :post
belongs_to :posts_surname
belongs_to :user
belongs_to :person
belongs_to :reactionpic, class_name: 'Emoticon'
end
