class CreateBlogLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :blog_likes do |t|
      t.integer :user_id, null: false
      t.integer :blog_id, null: false

      t.timestamps
    end
  end
end
