class CreateSecondSemesterPastQuestions < ActiveRecord::Migration
  def change
    create_table :second_semester_past_questions do |t|
      t.integer :year
      t.string :solution_url
      t.integer :second_semester_course_id

      t.timestamps
    end
  end
end
