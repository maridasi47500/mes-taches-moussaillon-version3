class CreateModedetransport < ActiveRecord::Migration[6.0]
  def change
    create_table :modedetransports do |t|
      t.integer :place_id
      t.integer :means_of_transport_id
    end
  end
end
