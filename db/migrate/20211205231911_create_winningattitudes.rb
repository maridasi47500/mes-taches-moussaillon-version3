class CreateWinningattitudes < ActiveRecord::Migration[6.0]
  def change
    create_table :winningattitudes do |t|
      t.text :content_fr
      t.text :content_en
      t.text :content_de
      t.timestamps
    end
  end
end
