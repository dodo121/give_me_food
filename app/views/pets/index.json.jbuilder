json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :date_of_birth
  json.url pet_url(pet, format: :json)
end
