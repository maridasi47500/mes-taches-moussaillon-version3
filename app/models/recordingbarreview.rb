class Recordingbarreview < ApplicationRecord
belongs_to :correctsample, class_name: 'Recording'
belongs_to :incorrectsample, class_name: 'Recording'
belongs_to :barattempt
belongs_to :barcriteria
belongs_to :gooduser, class_name: 'User'
end
