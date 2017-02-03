class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastename
      t.string :nick

      t.timestamps
    end
  end
end
