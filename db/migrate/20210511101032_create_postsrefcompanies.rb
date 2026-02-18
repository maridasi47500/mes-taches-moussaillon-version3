class CreatePostsrefcompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :postsrefcompanies do |t|
      t.integer :company_id
      t.integer :post_id
    end
  end
end
