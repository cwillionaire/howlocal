class Business < ActiveRecord::Base
  belongs_to :review_id
  belongs_to :user_id
end
