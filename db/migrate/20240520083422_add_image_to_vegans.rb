class AddImageToVegans < ActiveRecord::Migration[6.1]
  def change
    add_column :vegans, :image, :string
  end
end
