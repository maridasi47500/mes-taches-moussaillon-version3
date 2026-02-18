class AddInfluencesToWikipediaPages < ActiveRecord::Migration[6.0]
  def change
    add_column :wikipedia_pages, :influences, :string
  end
end
