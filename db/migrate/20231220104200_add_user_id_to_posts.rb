class AddUserIdToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :user_id, :int
  end
end
