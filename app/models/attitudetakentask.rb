class Attitudetakentask < ApplicationRecord
belongs_to :torealizetask
belongs_to :attitude
accepts_nested_attributes_for :attitude
end
