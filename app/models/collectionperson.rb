class Collectionperson < ApplicationRecord
belongs_to :collection
belongs_to :person
validates_uniqueness_of :collection_id, scope: :person_id
end
