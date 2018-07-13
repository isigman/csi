class AddCorpToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :corp, :string
  end
end
