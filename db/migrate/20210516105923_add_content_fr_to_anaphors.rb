class AddContentFrToAnaphors < ActiveRecord::Migration[6.0]
  def change
    add_column :anaphors, :description_fr, :text
    add_column :anaphors, :description_en, :text
    add_column :anaphors, :description_de, :text
  end
end
