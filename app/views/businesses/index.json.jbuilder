json.array!(@businesses) do |business|
  json.extract! business, :id, :review_id_id, :user_id_id, :name, :street_address, :city, :state, :zip, :average_rating, :description
  json.url business_url(business, format: :json)
end
