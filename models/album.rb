require("pg")

class Album

  attr_reader :title, :genre, :artist_id

  def initialize (options)

    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
    @id = options['id'].to_i

  end

  def save()

    sql = "INSERT INTO album (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i

  end

  def self.all

    sql = "SELECT * FROM album"
    albums = SqlRunner.run(sql)
    album_list = albums.map { |album| Album.new(album) }

  end

end
