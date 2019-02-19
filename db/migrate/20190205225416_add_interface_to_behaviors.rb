class AddInterfaceToBehaviors < ActiveRecord::Migration[5.2]
  def change
    add_reference :behaviors, :interface, foreign_key: true
  end
end
