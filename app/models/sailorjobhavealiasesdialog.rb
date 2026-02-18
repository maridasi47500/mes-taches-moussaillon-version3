class Sailorjobhavealiasesdialog < ApplicationRecord
belongs_to :sailorjobhavealias
belongs_to :othersailorjobhavealias, class_name: 'Sailorjobhavealias'
validates_uniqueness_of :sailorjobhavealias_id, scope: :othersailorjobhavealias_id
end
