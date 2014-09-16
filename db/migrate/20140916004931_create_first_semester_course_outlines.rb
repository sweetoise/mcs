class CreateFirstSemesterCourseOutlines < ActiveRecord::Migration
  def change
    create_table :first_semester_course_outlines do |t|
      t.string :topic
      t.string :book_url
      t.string :video_url
      t.text :content
      t.integer :first_semester_course_id

      t.timestamps
    end
  end
end
