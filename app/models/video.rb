class Video < ApplicationRecord
  has_and_belongs_to_many :posts
  has_and_belongs_to_many :authors, class_name: "User"


end
