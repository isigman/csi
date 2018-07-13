class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.numeric :user_id
      t.numeric :corp_id
      t.string :query_string
      t.numeric :results_count

      t.timestamps
    end
  end
end
