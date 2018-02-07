require("pg")
require_relative("../db/sql_runner.rb")

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize (options)

    @name = options['name']
    @id = options['id'].to_i

  end

  def save()

    sql = "INSERT INTO artist (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i

  end

  def self.all()

    sql = "SELECT * FROM artist"
    artists = SqlRunner.run(sql)
    artist_list = artists.map { |artist| Artist.new(artist)}

  end

  def self.all_albums(name)

    sql = "SELECT id FROM artist WHERE name = $1"
    values = [name]
    found_id = SqlRunner.run(sql, values)[0]['id'].to_i
    sql = "SELECT * FROM album WHERE artist_id = $1"
    values = [found_id]
    albums = SqlRunner.run(sql, values)
    albums_list = albums.map { |album| Album.new(album)}
    return albums_list

  end

  def update

    sql = "UPDATE artist SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)

  end

end
