class AddTypeToGoogleRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :google_requests, :type, :string
  end
end
