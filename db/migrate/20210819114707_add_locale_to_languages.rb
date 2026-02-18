class AddLocaleToLanguages < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :locale, :string
  end
end
