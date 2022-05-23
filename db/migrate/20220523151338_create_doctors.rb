class CreateDoctors < ActiveRecord::Migration[6.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :username
      t.string :thumbnail

      t.timestamps
    end
  end
end
