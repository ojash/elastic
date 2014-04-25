json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :hashtags
  json.url product_url(product, format: :json)
end
