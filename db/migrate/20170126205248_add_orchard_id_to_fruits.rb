class AddOrchardIdToFruits < ActiveRecord::Migration[5.0]
  def change
    add_column :fruits, :orchard_id, :integer
  end
end
