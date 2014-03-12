json.array!(@characteristics) do |characteristic|
  json.extract! characteristic, :id, :characteristicable_id, :characteristicable_type
  json.url characteristic_url(characteristic, format: :json)
end
