class Removecolumngfrds < ActiveRecord::Migration[6.0]
  def change
    remove_column :usurpations, :person_id
  end
end
