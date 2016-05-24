class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @filters= {
      Oldest: 'release_date ASC',
      Newest: 'release_date DESC',
      'A-Z': 'name DESC'
    }
    @filter = @filters[params[:filter]]
    @movies = Movie.order(@filter || :release_date).search(params[:search]).page(params[:page]).per(9)
    
    #order("release_date").page(params[:page]).per(3)
  
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @reviews = @movie.reviews.page(params[:page]).per(3)
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new movie_params
    if @movie.save
      redirect_to @movie, notice: 'Movie was successfully created.'
    else
      render :new, alert: @movie.errors.full_messages.to_sentence
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: 'Movie was successfully updated.'
    else
      render :edit
    end
    
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    
    redirect_to movies_url, notice: 'Movie was successfully destroyed.'
  end


  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :director, :summary, :release_date)
    end
end
