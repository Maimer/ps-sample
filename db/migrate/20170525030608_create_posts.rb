class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :subject,     null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :user_id,    null: false
      t.integer :group_id,   null: false

      t.timestamps null: false
    end

    add_index :posts, :group_id
  end
end
