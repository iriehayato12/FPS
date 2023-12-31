class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
