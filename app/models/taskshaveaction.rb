class Taskshaveaction < ApplicationRecord
belongs_to :task
belongs_to :taskaction, foreign_key:"action_id"
end
