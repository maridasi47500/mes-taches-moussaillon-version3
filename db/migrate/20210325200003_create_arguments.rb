class CreateArguments < ActiveRecord::Migration[6.0]
  def change
    create_table :arguments do |t|
      t.string :name
    end
  end
end
