class AddPlannedToMainThreads < ActiveRecord::Migration[6.0]
  def change
    add_column :main_threads, :planned, :datetime
  end
end
