class ChangeHostToBeStringInterface < ActiveRecord::Migration[5.2]
  def change
    change_column :interfaces, :host, :string
  end
end
