class CreateSecondSemesterCourses < ActiveRecord::Migration
  def change
    create_table :second_semester_courses do |t|
      t.string :code
      t.integer :course_type_id
      t.integer :credit_load
      t.integer :level_id
      t.integer :semester_id
      t.string :title
      t.text :content
      t.text :description

      t.timestamps
    end
  end
end
