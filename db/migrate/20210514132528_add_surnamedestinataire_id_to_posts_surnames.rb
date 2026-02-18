class AddSurnamedestinataireIdToPostsSurnames < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :surnamedestinataire_id, :integer
  end
end
