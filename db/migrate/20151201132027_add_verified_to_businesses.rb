class AddVerifiedToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :verified, :boolean
  end
end
