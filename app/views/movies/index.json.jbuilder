json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :director, :summary, :release_date
  json.url movie_url(movie, format: :json)
end
