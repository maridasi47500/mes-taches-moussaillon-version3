class AddLandryDatabase < ActiveRecord::Migration[6.0]
  def change
  create_table "Argent", force: :cascade do |t|
    t.integer "user_id"
    t.string "mois", limit: 15, null: false
    t.integer "annee", limit: 4, null: false
    t.integer "paye", limit: 11, default: 0, null: false
    t.integer "apayer", limit: 11, default: 18000, null: false
t.timestamps
  end

  add_column :users, :cuisinier, :integer
  add_column :users, :ordures, :integer
  create_table "Repas", force: :cascade do |t|
    t.integer "transaction_id" 
    t.integer "user_id" 
    t.integer "somme", limit: 11, null: false
    t.date "date", null: false
t.timestamps
  end
  create_table "Depense", force: :cascade do |t|
    t.integer "transaction_id" 
    t.integer :user_id
    t.integer "somme", limit: 11, null: false
    t.text "motif", null: false
    t.date "date", null: false
t.timestamps
  end

  create_table "Menu", force: :cascade do |t|
    t.string "menu", limit: 25, null: false
    t.integer "prix", limit: 11, default: 0, null: false
t.timestamps
  end
  create_table :menuhaverepas do |t|
    t.integer :menu_id
    t.integer :repas_id
t.timestamps
  end

  create_table "Transaction", force: :cascade do |t|
    t.integer "somme", limit: 11, null: false
    t.datetime "date", null: false
    t.string "motif", limit: 50, null: false
    t.integer :user_id
t.timestamps
  end

  end
end
