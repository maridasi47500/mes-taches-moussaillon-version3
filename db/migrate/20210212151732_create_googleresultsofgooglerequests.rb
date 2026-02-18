class CreateGoogleresultsofgooglerequests < ActiveRecord::Migration[6.0]
  def change
    create_table :googleresultsofgooglerequests do |t|
      t.integer :google_request_id
      t.integer :googleresult_id
    end
  end
end
