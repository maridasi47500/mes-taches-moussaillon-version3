class CreateResultsoffbsearches < ActiveRecord::Migration[6.0]
  def change
    create_table :resultsoffbsearches do |t|
      t.integer :facebooksearch_id
      t.integer :person_id
    end
  end
end
