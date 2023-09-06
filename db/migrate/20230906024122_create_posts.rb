class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :genre_id
      t.integer :user_id
      t.text :body
      t.datetime :start_time
      t.timestamps
    end
  end
end
