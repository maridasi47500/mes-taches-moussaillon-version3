class CreateI18nphraseshavealiases < ActiveRecord::Migration[6.0]
  def change
    create_table :i18nphraseshavealiases do |t|
      t.integer :alias_id
      t.integer :i18nphrase_id
    end
  end
end
