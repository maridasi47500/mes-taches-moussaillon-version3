class CreateMoviescene < ActiveRecord::Migration[6.0]
  def change
    create_table :moviescenes do |t|
      t.string :title
      t.string :description
    end
  end
end
