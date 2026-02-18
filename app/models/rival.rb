class Rival < ApplicationRecord
belongs_to :reallover, class_name: 'Person'
belongs_to :fakelover, class_name: 'Person'
validates_uniqueness_of :reallover_id, scope: :fakelover_id
has_and_belongs_to_many :rivalpeople, :join_table => :rivalrypeople, class_name: 'Person'
end
