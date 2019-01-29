class AddHasPaidToEnterprise < ActiveRecord::Migration[5.2]
  def change
    add_column :enterprises, :hasPaid, :boolean
  end
end
