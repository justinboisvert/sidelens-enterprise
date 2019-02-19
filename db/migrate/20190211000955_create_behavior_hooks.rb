class CreateBehaviorHooks < ActiveRecord::Migration[5.2]
  def change
    create_table :behavior_hooks do |t|
      t.string :ratelimit
      t.integer :behavior_id
      t.references :interface

      t.timestamps
    end
  end
end
