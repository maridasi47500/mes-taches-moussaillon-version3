class CreateMainThreads < ActiveRecord::Migration[6.0]
  def change
    create_table :main_threads do |t|
      t.datetime :created
      t.datetime :modified
    end
  end
end
