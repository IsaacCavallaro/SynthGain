class CreateFeatureListings < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_listings do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
