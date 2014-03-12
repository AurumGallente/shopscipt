json.array!(@properties) do |property|
  json.extract! property, :id, :name, :image, :propertyable_id, :propertyable_type
  json.url property_url(property, format: :json)
end
