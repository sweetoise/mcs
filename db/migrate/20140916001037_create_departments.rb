class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :institution_id
      t.integer :faculty_id

      t.timestamps
    end
  end
end
