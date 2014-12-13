json.array!(@places) do |place|
  json.extract! place, :id, :street, :city, :country
  json.url place_url(place, format: :json)
end
