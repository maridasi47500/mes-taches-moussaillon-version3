class Pride < ApplicationRecord
translates :content
has_and_belongs_to_many :instructions, :join_table => :instructionshaveprides
has_and_belongs_to_many :jobs, :join_table => :prideshavejobs
end
