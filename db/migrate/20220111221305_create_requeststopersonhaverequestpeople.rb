class CreateRequeststopersonhaverequestpeople < ActiveRecord::Migration[6.0]
  def change
    create_table :requeststopersonhaverequestpeople do |t|
      t.integer :requestperson_id
      t.integer :requeststoperson_id
    end
    create_table :aregoodrequests do |t|
      t.integer :requeststopersonhaverequestperson_id
      t.integer :alias_id
      t.integer :emoticon_id
      t.boolean :good
    end
  end
end
