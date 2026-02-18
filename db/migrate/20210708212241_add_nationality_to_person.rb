class AddNationalityToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :nationality, :string
  end
end
