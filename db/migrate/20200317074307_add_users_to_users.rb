class AddUsersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :self_introduction, :string
    add_column :users, :image, :string
  end
end
