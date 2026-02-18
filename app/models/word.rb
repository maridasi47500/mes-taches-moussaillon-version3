class Word < ApplicationRecord
  has_many :meanings
  accepts_nested_attributes_for :meanings, allow_destroy: true
  alias_attribute :content,:word
end
