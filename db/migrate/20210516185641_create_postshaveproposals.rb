class CreatePostshaveproposals < ActiveRecord::Migration[6.0]
  def change
    create_table :postshaveproposals do |t|
      t.integer :post_id
      t.integer :proposal_id
    end
  end
end
