class AddRoleToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :role, :string
  end
end
