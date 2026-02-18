class AddRoutineIdToEventsPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :events_posts, :routine_id, :integer
  end
end
