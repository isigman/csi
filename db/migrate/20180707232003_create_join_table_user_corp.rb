class CreateJoinTableUserCorp < ActiveRecord::Migration[5.1]
  def change
    create_join_table :corps, :users do |t|
      t.index [:corp_id, :user_id]
      # t.index [:user_id, :corp_id]
    end
  end
end
