json.array!(@products) do |product|
  json.extract! product, :id, :name, :article, :dealerprice, :dealercount, :largeprice, :large, :count, :smallprice, :smallcount, :retailprice, :retailcount
  json.url product_url(product, format: :json)
end
