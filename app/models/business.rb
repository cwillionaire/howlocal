class Business < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  
  # This method calculates and returns the average holo score for a business
  # when a rating is added or deleted.
  # @param business The business that is rated by the review. Its average rating will be modified
  # @param rating the rating either being added or deleted for the business
  # @param added boolean. True if a review was just added, false if just deleted
  # @return returns the new average holo rating for the business
    def calc_average_rating(rating, added)
      initial_average = self.average_rating.to_f           # average before the new review addition/deletion is factored in
      new_average = 0.0                                    # intialize new average variable
      num_reviews = self.reviews.length
      if added                                                 # if a review has just been added...
        new_average = ( ( initial_average * ( num_reviews - 1 ) )  + rating ) / num_reviews        #calculates new average
      elsif  num_reviews != nil                                # if a rating was just deleted and more ratings exist
        new_average = ( (initial_average * ( num_reviews + 1 ) ) - rating) / num_reviews # calculate new average
      end
      self.average_rating = new_average
      self.save
    end
  
  def calc_average_on_update ( old_rating, new_rating)
    running_sum = self.average_rating * self.reviews.length
    running_sum = running_sum + (new_rating - old_rating.to_f)
    new_average = running_sum / self.reviews.length
    self.average_rating = new_average
    self.save
  end 
end
