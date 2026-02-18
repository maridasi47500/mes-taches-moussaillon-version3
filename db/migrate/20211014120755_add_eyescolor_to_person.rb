class AddEyescolorToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :eyescolor, :string
  end
end
