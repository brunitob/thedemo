class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :description, :string
    add_column :users, :lookingfor, :string
  end
end
