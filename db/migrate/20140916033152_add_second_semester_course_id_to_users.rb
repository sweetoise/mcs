class AddSecondSemesterCourseIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :second_semester_course_id, :integer
  end
end
