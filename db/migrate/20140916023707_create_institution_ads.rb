class CreateInstitutionAds < ActiveRecord::Migration
  def change
    create_table :institution_ads do |t|
      t.string :name
      t.string :email
      t.text :address
      t.text :content
      t.string :website
      t.decimal :price, :precision => 11, :scale => 2
      t.integer :institution_id

      t.timestamps
    end
  end
end
