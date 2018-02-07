require("pg")
require_relative("../db/sql_runner.rb")

class Artist

  attr_reader :name, :id

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

  def sell.find(name)

    sql = "SELECT id FROM artist WHERE name = $1"
    values = [name]

  end

end
