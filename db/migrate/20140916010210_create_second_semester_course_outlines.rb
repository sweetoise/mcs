class CreateSecondSemesterCourseOutlines < ActiveRecord::Migration
  def change
    create_table :second_semester_course_outlines do |t|
      t.string :topic
      t.text :content
      t.string :book_url
      t.string :video_url
      t.integer :second_semester_course_id

      t.timestamps
    end
  end
end
