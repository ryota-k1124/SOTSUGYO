class AddTasteToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :taste, :text
  end
end
