class AddFirstSemesterCourseIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_semester_course_id, :integer
  end
end
