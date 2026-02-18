class CreateMediaJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :contents, :comments do |t|
      # t.index [:content_id, :comment_id]
      t.index [:comment_id, :content_id], unique: true
    end
  end
end
