class CreateTeas < ActiveRecord::Migration[6.0]
  def change
    create_table :teas do |t|
      t.string :flavor
      t.text :description

      t.timestamps
    end
  end
end
