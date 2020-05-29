class CreateItemOfTables < ActiveRecord::Migration[5.2]
  def change
    create_table :item_of_tables do |t|
      t.string :name

      t.timestamps
    end
  end
end
