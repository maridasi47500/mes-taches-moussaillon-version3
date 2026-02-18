class AddColumnamoureux < ActiveRecord::Migration[6.0]
  def change
add_column :linkspousepeople, :begindating, :date
add_column :linkspousepeople, :enddating, :date
  end
end
