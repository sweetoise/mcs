class CreateEmptySelects < ActiveRecord::Migration
  def change
    create_table :empty_selects do |t|
      t.string :name

      t.timestamps
    end
  end
end
