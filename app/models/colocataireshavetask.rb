class Colocataireshavetask < ApplicationRecord
belongs_to :colocataire
belongs_to :task
validates_uniqueness_of :colocataire_id, scope: :task_id
end
