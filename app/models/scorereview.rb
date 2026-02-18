class Scorereview < APplicationRecord
belongs_to :gooduser, class_name: 'User'
belongs_to :barattempt
belongs_to :scorecriteria
end
