class Cast < ActiveRecord::Base
  has_and_belongs_to_many :movie

  def generate_cast movie_id #Grabs top 10 cast ID's in a movie, creates cast object if not already created 

    key=ENV["TMDB_API"]
    cast_url = URI.parse("http://api.themoviedb.org/3/movie/#{movie_id}/credits?api_key=#{key}")
    req = Net::HTTP::Get.new(cast_url)
    c = Net::HTTP.start(cast_url.host, cast_url.port) {|http|
      http.request(req)
    }
    hash=JSON.parse(c.body)
    hash=hash["cast"]

    hash.each do |i|
      
      cast_id=hash[i]["id"]
      create_cast_member cast_id unless self.exists? cast_id
    end

  end


  private

  def create_cast_member id
    #make call to 'People/ID' url
    #create Cast from the hash information
    #link to movie?


    #Cast.create(name: hash[i]["name], director: "Placeholder_D", summary: hash[i]["overview"], release_date: hash[i]["release_date"], poster_path: hash[i]["poster_path"], tmdb_id: hash[i]["id"])
  end
end
