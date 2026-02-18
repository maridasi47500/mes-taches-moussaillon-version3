class CreateI18nphraseshavepeople < ActiveRecord::Migration[6.0]
  def change
    create_table :i18nphraseshavepeople do |t|
      t.integer :person_id
      t.integer :i18nphrase_id
    end
    create_table :i18nphraseshavethings do |t|
      t.integer :thing_id
      t.integer :i18nphrase_id
    end
    #create_table :taskhavedescriptions do |t|
    #  t.string :description_en
    #  t.string :description_fr
    #  t.string :description_fr
    #  t.boolean :draft, default: true
    #  t.timestamps
    #end
  end
end
