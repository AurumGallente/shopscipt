json.array!(@images) do |image|
  json.extract! image, :id, :image, :imageable_id, :imageable_type
  json.url image_url(image, format: :json)
end
