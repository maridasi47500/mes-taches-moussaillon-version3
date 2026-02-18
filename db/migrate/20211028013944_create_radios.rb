class CreateRadios < ActiveRecord::Migration[6.0]
  def change
    create_table :radios do |t|
      t.string :frequency
      t.string :motto_fr
      t.string :motto_en
      t.string :motto_de
      t.string :radioname
    end
    create_table :radioshavecities do |t|
      t.string :city_id
      t.string :radio_id
    end
    create_table :radioshavejingles do |t|
      t.string :jingle_id
      t.string :radio_id
    end
    
  end
end
