class CollectionsPerson < ApplicationRecord
belongs_to :person
belongs_to :collection
validates_uniqueness_of :person_id, scope: :collection_id
end
