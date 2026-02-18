class RenameNameFromAttitudes < ActiveRecord::Migration[6.0]
  def change
    rename_column :attitudes, :name, :name_fr
    add_column :attitudes, :name_en, :string
    add_column :attitudes, :name_de, :string
    rename_column :reactions_texts, :name, :name_fr
    add_column :reactions_texts, :name_en, :string
    add_column :reactions_texts, :name_de, :string
  end
end
