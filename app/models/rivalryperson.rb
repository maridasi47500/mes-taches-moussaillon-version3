class Rivalryperson < Application
belongs_to :rival
belongs_to :person
validates_uniqueness_of :rival_id, scope: :person_id
end
