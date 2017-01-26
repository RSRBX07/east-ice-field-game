class CreateOrchards < ActiveRecord::Migration[5.0]
  def change
    create_table :orchards do |t|

      t.timestamps
    end
  end
end
