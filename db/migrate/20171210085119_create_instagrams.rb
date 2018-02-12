class CreateInstagrams < ActiveRecord::Migration
  def change
    create_table :instagrams do |t|
      t.string :content
      t.string :image
      t.timestamps null: false
    end
  end
end
