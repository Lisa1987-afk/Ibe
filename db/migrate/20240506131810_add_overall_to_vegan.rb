class AddOverallToVegan < ActiveRecord::Migration[6.1]
  def change
    add_column :vegans, :overall, :integer
  end
end
