class CreateI18nphraseshaveplaces < ActiveRecord::Migration[6.0]
  def change
    create_table :i18nphraseshaveplaces do |t|
      t.integer :place_id
      t.integer :i18nphrase_id
    end
  end
end
