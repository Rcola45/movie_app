# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "net/https"
require "uri"

d1 = DateTime.new(2009, 3, 18)
d2 = DateTime.new(2010, 8, 19)
d3 = DateTime.new(2011, 7, 10)
d4 = DateTime.new(2012, 1, 20)
d5 = DateTime.new(2013, 5, 19)
d6 = DateTime.new(2014, 3, 4)
d7 = DateTime.new(2015, 8, 9)
d8 = DateTime.new(2016, 7, 22)


Movie.create(title: "Shrek", director: "Michael Bay",summary: "Shrek does something funny again",release_date: d1, poster_path: nil)
Movie.create(title: "Shrek 2", director: "Michael Myers",summary: "Donkey gets involved this time",release_date: d2, poster_path: nil)
Movie.create(title: "Donkey and Shrek", director: "Donkey",summary: "Wacky antics happen again",release_date: d3, poster_path: nil)
Movie.create(title: "Fiona 2", director: "Shrek",summary: "Fiona and Donkey have their own movie without Shrek",release_date: d4, poster_path: nil)
Movie.create(title: "Shrek 3", director: "Fiona Donkey",summary: "Shrek comes back and gets mad",release_date: d5, poster_path: nil)
Movie.create(title: "Donkey 2", director: "Shrek and Fiona",summary: "Shrek is funny again",release_date: d6, poster_path: nil)
Movie.create(title: "Shrek and Beyond", director: "Everyone",summary: "All out clan battle",release_date: d7, poster_path: nil)
Movie.create(title: "Shrek is no More", director: "Nobody", summary: "Everyone died in the last movie", release_date: d8, poster_path: nil)
Movie.create(title: "Shrek is no Mor", director: "Nobody", summary: "Everyone died in the last movie", release_date: d2, poster_path: nil)


User.create(email: 'rcola45@hotmail.com', password: 'rcola45')


url = URI.parse('http://api.themoviedb.org/3/discover/movie?primary_release_year=2016&page=2&api_key=0115aca4729dbb6e612f83f3750506fa')
req = Net::HTTP::Get.new(url)
m = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
hash=JSON.parse(m.body)
hash=hash["results"]

20.times do |i|
 Movie.create(title: hash[i]["title"], director: "Placeholder_D", summary: hash[i]["overview"], release_date: hash[i]["release_date"], poster_path: hash[i]["poster_path"])
end
