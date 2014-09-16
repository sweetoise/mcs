class CreateTermsOfUses < ActiveRecord::Migration
  def change
    create_table :terms_of_uses do |t|
      t.text :introduction
      t.string :terms
      t.text :description

      t.timestamps
    end
  end
end
