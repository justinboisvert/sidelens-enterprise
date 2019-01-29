class CreateInterfaces < ActiveRecord::Migration[5.2]
  def change
    create_table :interfaces do |t|
      t.integer :host
      t.integer :port
      t.string :name
      t.boolean :connected
      t.references :enterprise, foreign_key: true

      t.timestamps
    end
  end
end
