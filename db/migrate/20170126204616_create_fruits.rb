class CreateFruits < ActiveRecord::Migration[5.0]
  def change
    create_table :fruits do |t|
      t.string :color
      t.datetime :croped_at

      t.timestamps
    end
  end
end
