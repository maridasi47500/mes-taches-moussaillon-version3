class Comment < ApplicationRecord
has_and_belongs_to_many :contents
belongs_to :user, optional: true
end
