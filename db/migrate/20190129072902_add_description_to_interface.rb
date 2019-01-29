class AddDescriptionToInterface < ActiveRecord::Migration[5.2]
  def change
    add_column :interfaces, :description, :string
  end
end
