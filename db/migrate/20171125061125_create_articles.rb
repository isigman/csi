class CreateArticles < ActiveRecord::Migration[5.1]

  def change
    create_table :articles do |t|
      t.string :title
      t.text :summary
      t.string :link
      t.string :tag_list
      t.integer :views

      t.timestamps
    end
  end
end
