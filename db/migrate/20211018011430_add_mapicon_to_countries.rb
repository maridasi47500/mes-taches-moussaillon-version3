class AddMapiconToCountries < ActiveRecord::Migration[6.0]
  def change
    add_column :countries, :mapicon, :string
  end
end
