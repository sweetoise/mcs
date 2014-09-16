class CreateFirstSemesterPastQuestions < ActiveRecord::Migration
  def change
    create_table :first_semester_past_questions do |t|
      t.integer :year
      t.string :solution_url
      t.integer :first_semester_course_id

      t.timestamps
    end
  end
end
