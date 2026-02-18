class Changevalidationmultilangue < ActiveRecord::Migration[6.0]
  def change
    rename_column :proposalvalidations, :content, :content_fr
    add_column :proposalvalidations, :content_en, :text
        add_column :proposalvalidations, :content_de, :text                                                                                                                      
  end
end
