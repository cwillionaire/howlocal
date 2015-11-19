class AddValuesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :location, :string
    add_column :users, :admin, :boolean
    add_column :users, :busi_own, :boolean
  end
end
