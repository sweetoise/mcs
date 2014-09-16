class CreatePrivacyTerms < ActiveRecord::Migration
  def change
    create_table :privacy_terms do |t|
      t.text :introduction
      t.string :policy
      t.text :description

      t.timestamps
    end
  end
end
