class CreateDices < ActiveRecord::Migration[5.0]
  def change
    create_table :dices do |t|
      t.string :showing_face

      t.timestamps
    end
  end
end
