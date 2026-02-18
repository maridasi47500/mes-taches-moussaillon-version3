class Threadhavemanypost < ApplicationRecord
  belongs_to :poststhread
  belongs_to :post
  validates_uniqueness_of :poststhread_id, scope: :post_id
end
