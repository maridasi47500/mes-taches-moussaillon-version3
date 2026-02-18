class CreateLinkfacebooksearchtasks < ActiveRecord::Migration[6.0]
  def change
    create_table :linkfacebooksearchtasks do |t|
      t.integer :task_id
      t.integer :facebooksearch_id
    end
  end
end
