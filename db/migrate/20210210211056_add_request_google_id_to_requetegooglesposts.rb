class AddRequestGoogleIdToRequetegooglesposts < ActiveRecord::Migration[6.0]
  def change
    add_column :requetegooglesposts, :google_request_id, :integer
  end
end
