class CreateUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.string :country
      t.string :city
      t.string :street
      t.integer :postcode

      t.timestamps
    end
  end
end
