class Removecolumnfromusers < ActiveRecord::Migration
  def up
    remove_column :users, :encrypted_password, :string
  end

  def down
    add_column :users, :encrypted_password, :string
  end
end
