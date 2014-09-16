class CreateDepartmentNotices < ActiveRecord::Migration
  def change
    create_table :department_notices do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.integer :department_id
      t.string :signed_by

      t.timestamps
    end
  end
end
