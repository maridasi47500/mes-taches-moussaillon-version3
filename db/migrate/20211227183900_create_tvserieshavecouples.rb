class CreateTvserieshavecouples < ActiveRecord::Migration[6.0]
  def change
    create_table :tvserieshavecouples do |t|
      t.integer :tvserieshaveactor_id
      t.integer :othertvserieshaveactor_id
    end
    create_table :tvseriesparodiehavecouples do |t|
      t.integer :tvseriesparodiehaveactor_id
      t.integer :othertvseriesparodiehaveactor_id
    end
    create_table :filmparodiehavecouples do |t|
      t.integer :filmparodiehaveactor_id
      t.integer :otherfilmparodiehaveactor_id
    end
    create_table :filmhavecouples do |t|
      t.integer :phavefilm_id
      t.integer :otherphavefilm_id
    end
  end
end
