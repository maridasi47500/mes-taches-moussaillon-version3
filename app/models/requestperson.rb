class Requestperson < ApplicationRecord
belongs_to :persona, class_name: 'Person'
belongs_to :personb, class_name: 'Person'
validates_uniqueness_of :persona_id, scope: :personb_id
end
