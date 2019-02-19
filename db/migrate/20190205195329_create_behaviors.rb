class CreateBehaviors < ActiveRecord::Migration[5.2]
  def change
    create_table :behaviors do |t|
      t.string :name
      t.string :description
      t.string :bscript
      t.references :enterprise, foreign_key: true

      t.timestamps
    end
  end
end
