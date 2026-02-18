class Photocomment < ApplicationRecord
  belongs_to :photo
  translates :content
end

