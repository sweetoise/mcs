class CreateFirstSemesterCourses < ActiveRecord::Migration
  def change
    create_table :first_semester_courses do |t|
      t.string :code
      t.integer :credit_load
      t.text :description
      t.string :title
      t.integer :course_type_id
      t.integer :level_id
      t.string :semester_id
      t.text :content

      t.timestamps
    end
  end
end
