json.extract! listing, :id, :title, :description, :price, :availability, :condition, :category_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
