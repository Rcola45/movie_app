class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:show, :index, :destroy]
  before_action :set_movie, only: [:new, :edit, :create, :update]
  # GET /reviews
  # GET /reviews.json
  def index
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show    
  end

  # GET /reviews/new
  def new
    
    @review = @movie.reviews.new
    @review.user_id=current_user.id
  end

  # GET /reviews/1/edit
  def edit
    @review=@movie.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = current_user.reviews.new(review_params)
    @review.movie_id=@movie.id
    if @review.save
      redirect_to movie_path(@movie), notice: 'Review was successfully created.'
    else
      render :new 
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @review=@movie.reviews.find(params[:id])
    
    if @review.update(review_params)
      redirect_to @movie, notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_to reviews_url, notice: 'Review was successfully destroyed.'
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie=Movie.find(params[:movie_id])
    end
    def set_reviews
      @reviews = @movie.reviews.page(params[:page]).per(3)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content, :rating, :user, :movie_id)
    end



end
