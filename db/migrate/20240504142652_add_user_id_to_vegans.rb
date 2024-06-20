class AddUserIdToVegans < ActiveRecord::Migration[6.1]
  def change
    add_column :vegans, :user_id, :integer
  end
end
