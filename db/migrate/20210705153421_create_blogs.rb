class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :user_id, null: false
      t.integer :sport, null: false
      t.string :title, null: false
      t.string :blog_image_id
      t.text :body, null: false

      t.timestamps
    end
  end
end
