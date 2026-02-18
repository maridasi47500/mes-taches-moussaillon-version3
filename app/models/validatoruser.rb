class Validatoruser < ApplicationRecord
  belongs_to :post, class_name: "Post", foreign_key: "post_id"
  belongs_to :validator, class_name: 'User', foreign_key: "user_id"
  validates_uniqueness_of :post_id, scope: :user_id
end
