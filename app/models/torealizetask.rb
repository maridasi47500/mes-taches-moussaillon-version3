class Torealizetask < ApplicationRecord
belongs_to :task
belongs_to :user
has_many :attitudetakentasks
accepts_nested_attributes_for :attitudetakentasks, allow_destroy: true
end
