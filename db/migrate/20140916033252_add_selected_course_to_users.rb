class AddSelectedCourseToUsers < ActiveRecord::Migration
  def change
    add_column :users, :selected_course, :string
  end
end
