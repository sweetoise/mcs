class CreateCopywriteTerms < ActiveRecord::Migration
  def change
    create_table :copywrite_terms do |t|
      t.string :term
      t.text :content

      t.timestamps
    end
  end
end
