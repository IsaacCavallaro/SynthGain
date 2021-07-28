class RemoveListingFromCarts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :carts, :listing, null: false, foreign_key: true
  end
end
