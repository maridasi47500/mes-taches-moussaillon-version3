class Fakecomment < ApplicationRecord
  has_and_belongs_to_many :posts, :join_table => :fakecomenttables
end
