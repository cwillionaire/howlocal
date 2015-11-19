json.array!(@reviews) do |review|
  json.extract! review, :id, :comment, :holo_score, :business_id, :user_id
  json.url review_url(review, format: :json)
end
