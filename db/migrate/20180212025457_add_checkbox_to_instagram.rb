class AddCheckboxToInstagram < ActiveRecord::Migration
  def change
    add_column :instagrams, :checkbox, :boolean
  end
end
