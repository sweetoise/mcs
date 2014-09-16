class CreateDepartmentUpdates < ActiveRecord::Migration
  def change
    create_table :department_updates do |t|
      t.string :title
      t.text :content
      t.string :signed_by
      t.datetime :date
      t.integer :department_id

      t.timestamps
    end
  end
end
