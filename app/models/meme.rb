
class Meme < ApplicationRecord
  belongs_to :person
  belongs_to :post
end