class CreateRanks < ActiveRecord::Migration[5.2]
  def change
    create_table :ranks do |t|
      t.string :title
      t.string :img

      t.timestamps
    end
  end
end
