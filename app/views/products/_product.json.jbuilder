json.extract! product, :id, :title, :description, :price, :purchasing_price, :image, :catagory, :belongs_to, :Shop, :created_at, :updated_at
json.url product_url(product, format: :json)
