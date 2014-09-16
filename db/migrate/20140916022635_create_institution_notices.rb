class CreateInstitutionNotices < ActiveRecord::Migration
  def change
    create_table :institution_notices do |t|
      t.string :title
      t.text :content
      t.text :signed_by
      t.datetime :date
      t.integer :institution_id

      t.timestamps
    end
  end
end
