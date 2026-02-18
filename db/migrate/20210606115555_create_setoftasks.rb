class CreateSetoftasks < ActiveRecord::Migration[6.0]
  def change
    create_table :setoftasks do |t|
      t.string :title
    end
  end
end
