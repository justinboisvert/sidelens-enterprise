class AddBehaviorListToInterface < ActiveRecord::Migration[5.2]
  def change
    add_column :interfaces, :behavior_list, :string
  end
end
