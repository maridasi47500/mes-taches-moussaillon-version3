class Poststhread < ApplicationRecord
  has_and_belongs_to_many :posts, :join_table => :threadhavemanyposts
  before_create do
    j=Poststhread.where(title: self.title)[0] ? false : true
      p j
      j
    
  end
end