class Jingleshavereaction < ApplicationRecord
belongs_to :jingle
belongs_to :reaction
validates_uniqueness_of :jingle_id, scope: :reaction_id
end
