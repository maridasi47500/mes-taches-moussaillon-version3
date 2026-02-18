class CreateI18nphraseshavecities < ActiveRecord::Migration[6.0]
  def change
    create_table :i18nphraseshavecities do |t|
      t.integer :i18nphrase_id
      t.integer :city_id
    end
  end
end
