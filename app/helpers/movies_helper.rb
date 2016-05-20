module MoviesHelper
  def get_image(m)
    if m.poster_path.present?
      return "http://image.tmdb.org/t/p/w185#{m.poster_path}"
    else
      return "poster_template.jpg"
    end
  end
end
