class PlacesTask < ApplicationRecord
  belongs_to :place
  belongs_to :task
  validates_uniqueness_of :place_id, scope: :task_id
end

