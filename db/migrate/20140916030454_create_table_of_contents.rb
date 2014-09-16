class CreateTableOfContents < ActiveRecord::Migration
  def change
    create_table :table_of_contents do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
