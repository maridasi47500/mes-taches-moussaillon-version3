class AddMakeupstyleIdToSelfportrait < ActiveRecord::Migration[6.0]
  def change
    add_column :selfportraits, :makeupstyle_id, :integer
  end
end
