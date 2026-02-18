class CreateAnaphorsPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :anaphors_posts do |t|
      t.integer :anaphor_id
      t.integer :post_id
    end
  end
end
