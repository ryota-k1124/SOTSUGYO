class AddCheckboxToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :checkbox, :boolean
  end
end
