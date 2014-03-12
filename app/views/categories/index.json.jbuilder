json.array!(@categories) do |category|
  json.extract! category, :id, :name, :title, :description, :text
  json.url category_url(category, format: :json)
end
