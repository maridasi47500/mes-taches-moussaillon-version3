class CreateMessagecaches < ActiveRecord::Migration[6.0]
  def change
    create_table :messagecaches do |t|
      t.string :content
    end
  end
end
