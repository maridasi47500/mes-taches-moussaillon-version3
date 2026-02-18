class Synonym < ApplicationRecord
  belongs_to :synonym, optional: true
  has_one :meaning, class_name: "Synonym"
  has_and_belongs_to_many :posts
  def textedusynonyme
    read_attribute(:textedusynonyme)
  end
  def meaning
    Synonym.find_by(synonym: self) || self.posts.first
  end
end
