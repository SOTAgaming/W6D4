class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :like_type, null: false
      t.integer :like_id, null: false
      t.integer :user_id, null: false
      t.timestamps
    end
    add_index :likes, :like_id
    add_index :likes, :user_id
    add_index :likes, [:user_id, :like_id, :like_type], unique: true
  end
end
