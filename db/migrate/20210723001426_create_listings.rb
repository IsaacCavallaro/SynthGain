class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.float :price
      t.boolean :availability
      t.integer :condition
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
