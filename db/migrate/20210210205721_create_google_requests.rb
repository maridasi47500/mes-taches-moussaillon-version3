class CreateGoogleRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :google_requests do |t|
      t.string :name
    end
  end
end
