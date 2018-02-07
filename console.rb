require("pry-byebug")
require_relative("./models/artist.rb")
require_relative("./models/album.rb")

artist1 = Artist.new({'name' => "Wu Tang Clan"})
artist1.save
album1 = Album.new({'title' => "Enter the 36 Chambers", 'genre' => "Hip-hop", 'artist_id' => artist1.id})
album1.save
artist2 = Artist.new({'name' => "Naughty By Nature"})
artist2.save
album2 = Album.new({'title' => "Nineteen Naughty Three", 'genre' => "Hip-hop", 'artist_id' => artist2.id})
album2.save
album3 = Album.new({'title' => "Poverty's Paradise", 'genre' => "Hip-hop", 'artist_id' => artist2.id})
album3.save
artist4 = Artist.new({'name' => "Stone Roles"})
artist4.save
artist4.name = "The Stone Roses"
artist4.update
album4 = Album.new({'title' => "The Stone Roses", 'genre' => "Indie", 'artist_id' => artist4.id})
album4.save

album4.title = "The Second Coming"



binding.pry
nil
