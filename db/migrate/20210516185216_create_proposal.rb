class CreateProposal < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.boolean :validated
      t.text :content_fr
      t.text :content_en
      t.text :content_de
    end
  end
end
