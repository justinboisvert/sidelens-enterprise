class CreateEnterprises < ActiveRecord::Migration[5.2]
  def change
    create_table :enterprises do |t|
      t.text :username
      t.text :password
      t.text :company
      t.timestamps
    end
  end
end
