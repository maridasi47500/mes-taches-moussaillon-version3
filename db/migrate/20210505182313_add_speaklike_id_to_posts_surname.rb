class AddSpeaklikeIdToPostsSurname < ActiveRecord::Migration[6.0]
  def change
    add_column :posts_surnames, :speaklike_id, :integer
    add_column :posts_surnames, :destinataire_id, :integer
    add_column :posts_surnames, :realname_id, :integer
  end
end
