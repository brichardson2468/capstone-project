class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :username
      t.datetime :DOB
      t.integer :doctor_id

      t.timestamps
    end
  end
end
