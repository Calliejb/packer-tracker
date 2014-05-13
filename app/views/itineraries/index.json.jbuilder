json.array!(@itineraries) do |itinerary|
  json.extract! itinerary, :id, :name, :country, :date
  json.url itinerary_url(itinerary, format: :json)
end
