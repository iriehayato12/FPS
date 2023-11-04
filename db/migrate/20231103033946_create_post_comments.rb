class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :post_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
