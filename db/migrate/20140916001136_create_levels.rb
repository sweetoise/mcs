class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.integer :level
      t.integer :institution_id
      t.integer :faculty_id
      t.integer :department_id

      t.timestamps
    end
  end
end
