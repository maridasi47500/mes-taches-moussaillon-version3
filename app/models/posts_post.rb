class PostsPost < ApplicationRecord
belongs_to :otherpost, class_name: 'Post'
belongs_to :post
validates_uniqueness_of :otherpost_id, scope: :post_id
end
