class AddValidatedToMainThreads < ActiveRecord::Migration[6.0]
  def change
    add_column :main_threads, :validated, :boolean
  end
end
