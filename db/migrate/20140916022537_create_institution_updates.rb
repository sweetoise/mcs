class CreateInstitutionUpdates < ActiveRecord::Migration
  def change
    create_table :institution_updates do |t|
      t.string :title
      t.text :content
      t.integer :institution_id

      t.timestamps
    end
  end
end
