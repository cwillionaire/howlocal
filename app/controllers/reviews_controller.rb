class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @user = User.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @user = User.all
    @business = Business.all
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @businesses = Business.all
  end

  # GET /reviews/1/edit
  def edit
    @businesses = Business.all
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
       @review.business.calc_average_rating(@review.holo_score, true)   # recalculates average rating the business the review is reviewing
        format.html { redirect_to business_path(id: @review.business_id), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    old_rating = @review.holo_score
    respond_to do |format|
      if @review.update(review_params)
        new_rating = @review.holo_score
        @review.business.calc_average_on_update(old_rating, new_rating)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    old_rating = @review.holo_score             # the rating of the review that is about to be destroyed
    @review.destroy
    respond_to do |format|
      @review.business.calc_average_rating(old_rating, false)    # calculates new average
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:comment, :holo_score, :business_id, :user_id, :title)
    end
end
