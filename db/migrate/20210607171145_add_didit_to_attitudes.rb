class AddDiditToAttitudes < ActiveRecord::Migration[6.0]
  def change
    add_column :attitudes, :didit, :boolean
  end
end
