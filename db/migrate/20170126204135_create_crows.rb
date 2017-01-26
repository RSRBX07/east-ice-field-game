class CreateCrows < ActiveRecord::Migration[5.0]
  def change
    create_table :crows do |t|
      t.integer :advancement, default: 0

      t.timestamps
    end
  end
end
