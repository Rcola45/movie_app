class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :index, :destroy]
  before_action :set_username
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
    @movie=Movie.find(params[:movie_id])
    @review = @movie.reviews.new
    @review.user_id=current_user.id
  end

  # GET /reviews/1/edit
  def edit
    @movie=Movie.find(params[:movie_id])
    @review=@movie.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @movie=Movie.find(params[:movie_id])
    @review = current_user.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_path(@movie), notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: movie_path(@movie)}
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @movie=Movie.find(params[:movie_id])
    @review=@movie.reviews.find(params[:id])
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @movie, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @reviews = @movie.reviews.all.page(params[:page]).per(3)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:title, :content, :rating, :user)
    end



end
