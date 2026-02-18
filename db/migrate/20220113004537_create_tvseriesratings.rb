class CreateTvseriesratings < ActiveRecord::Migration[6.0]
  def change
    create_table :togethertvseriesratings do |t|
      t.integer :rating
      t.integer :tvserieshaveactor_id
      t.integer :user_id
      t.text :content_fr
      t.text :content_en
      t.text :content_de
    end
    create_table :tvseriesratingshavepeople do |t|
      t.integer :togethertvseriesrating_id
      t.integer :person_id
    end
  end
end
