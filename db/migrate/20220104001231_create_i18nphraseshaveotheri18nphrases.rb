class CreateI18nphraseshaveotheri18nphrases < ActiveRecord::Migration[6.0]
  def change
    create_table :i18nphraseshaveotheri18nphrases do |t|
      t.integer :i18nphrase_id
      t.integer :otheri18nphrase_id
    end
  end
end
