json.array!(@products) do |product|
  json.extract! product, :id, :url, :aim_price, :description
  json.url product_url(product, format: :json)
end
