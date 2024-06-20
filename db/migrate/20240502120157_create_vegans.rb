class CreateVegans < ActiveRecord::Migration[6.1]
  def change
    create_table :vegans do |t|
      t.string :name
      t.string :genre
      t.integer :price
      t.string :adress
      t.text :about

      t.timestamps
    end
  end
end
