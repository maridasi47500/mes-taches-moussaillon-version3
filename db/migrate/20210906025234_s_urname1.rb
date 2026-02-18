class SUrname1 < ActiveRecord::Migration[6.0]
  def change
    create_table :posts_surname_meanings do |t|
    t.integer "ps_id"
    t.text "post_id"
    t.text "surname_id"
    t.text "person_id"
    t.text "sailor_id"
    t.text "place_id"
    t.text "posts_surname_id"
    t.text "thing_id"
    t.text "other_posts_surname_id"
    t.text "action_name"
    t.text "profilepic_id"
    t.text "speaklike_id"
    t.text "destinataire_id"
    t.text "realname_id"
    t.text "fakename"
    t.text "content_en"
    t.text "content_fr"
    t.text "content_de"
    t.text "surnamedestinataire_id"
    t.text "recordingphrase_id"
    t.text "recordingword_id"
    t.text "stranger_id"
#rails g scaffold_controller posts_surname_meaning ps_id post_id surname_id person_id sailor_id place_id posts_surname_id thing_id other_posts_surname_id action_name profilepic_id speaklike_id destinataire_id realname_id fakename content_en content_fr content_de surnamedestinataire_id recordingphrase_id recordingword_id stranger_id

	end

  end
end
