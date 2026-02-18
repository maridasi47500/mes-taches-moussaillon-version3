class Severalpeoplestory < ApplicationRecord
validates_uniqueness_of :myid, scope: :reaction_id
belongs_to :reaction
has_many :storysentencestoryhavepeople
has_many :posts_surnames, through: :storysentencestoryhavepeople, autosave: true
accepts_nested_attributes_for :posts_surnames, allow_destroy: true
end
