class Sailorandaction < ApplicationRecord
has_and_belongs_to_many :sailors, :join_table => :exchangebetweensailorandactions, class_name: 'Person'
def taskaction
action
end
belongs_to :person
belongs_to :action, class_name: 'Taskaction', optional: true
validates_uniqueness_of :person_id, scope: :action_id
end
