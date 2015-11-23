class Business < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
end
