class AddBirthNameToWikipediaPages < ActiveRecord::Migration[6.0]
  def change
    add_column :wikipedia_pages, :name_of_birth, :string
    add_column :wikipedia_pages, :date_of_birth, :date
    add_column :wikipedia_pages, :place_of_birth, :string
    add_column :wikipedia_pages, :main_activity, :string
    add_column :wikipedia_pages, :musical_genre, :string
    add_column :wikipedia_pages, :instruments, :string
    add_column :wikipedia_pages, :active_years, :date
    add_column :wikipedia_pages, :official_site, :string
  end
end
