class AddTasteToInstagram < ActiveRecord::Migration
  def change
    add_column :instagrams, :taste, :text
  end
end
