class Fromsomeonegossip < ApplicationRecord
  has_and_belongs_to_many :anaphors, join_table: :explaingossips
  accepts_nested_attributes_for :anaphors, allow_destroy: true
  belongs_to :reaction, optional: true
  def mostrecentreactions
    Reaction.where(id: reaction_id)+Reaction.last(10)
  end
end
