class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.integer :user_id, null: false
      t.integer :sport, null: false
      t.string :title, null: false
      t.datetime :event_date, null: false
      t.datetime :due_date, null: false
      t.integer :prefecture, null: false
      t.string :place, null: false
      t.integer :recruit_number, null: false
      t.integer :level, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
