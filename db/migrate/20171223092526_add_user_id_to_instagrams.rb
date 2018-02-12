class AddUserIdToInstagrams < ActiveRecord::Migration
  def change
    add_column :instagrams, :user_id, :integer
  end
end
