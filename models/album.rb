require("pg")

class Album

  attr_accessor :title, :genre
  attr_reader :artist_id

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

  def artist

    # sql = "SELECT artist_id FROM album WHERE title = $1"
    # values = [title]
    # found_id = SqlRunner.run(sql, values)[0]['artist_id'].to_i
    sql = "SELECT * FROM artist WHERE id = $1"
    values = [@artist_id]
    found_artist = SqlRunner.run(sql, values)[0]
    found_artist = Artist.new(found_artist)

  end

  def update

    sql = "UPDATE album SET (title, genre) = ($1, $2) WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)

  end

  def delete

    sql = "DELETE FROM album WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)

  end

  def self.find(id)

    sql = "SELECT * FROM album WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result[0]

  end


end
