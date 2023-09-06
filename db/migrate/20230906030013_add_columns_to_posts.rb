class AddColumnsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :genre_id, :integer
    add_column :posts, :user_id, :integer
    add_column :posts, :body, :text
    add_column :posts, :start_time, :datetime
  end
end
