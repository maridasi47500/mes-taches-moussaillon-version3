class CreatePostlikecomment < ActiveRecord::Migration[6.0]
  def change
    create_table :postlikecomments do |t|
      t.integer :post_id
      t.integer :setoftask_id
      t.integer :sailor_id
      t.integer :task_id
      t.integer :musicalinstrument_id
      t.integer :score_id
      t.integer :attitude_id
    end
  end
end
