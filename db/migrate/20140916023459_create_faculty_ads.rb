class CreateFacultyAds < ActiveRecord::Migration
  def change
    create_table :faculty_ads do |t|
      t.string :name
      t.string :email
      t.text :address
      t.text :content
      t.string :website
      t.decimal :price , :precision => 11, :scale => 2
      t.integer :faculty_id

      t.timestamps
    end
  end
end
