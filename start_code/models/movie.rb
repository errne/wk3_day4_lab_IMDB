require_relative("../db/sql_runner")

class Movie

  attr_accessor :title, :genre, :budget
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO movies
    (title,
      genre,
      budget)
      VALUES
      ($1,
        $2,
        $3)
        RETURNING id"
        values = [@title, @genre, @budget]
        movie = SqlRunner.run(sql, values).first
        @id = movie['id'].to_i
      end

      def stars()
        sql = "SELECT stars.*
        FROM stars
        INNER JOIN castings
        ON castings.star_id = stars.id
        WHERE movie_id = $1"
        values = [@id]
        stars = SqlRunner.run(sql, values)
        return stars.map { |star| Star.new(star) }
      end

      def remaining_budget()
        sql = "SELECT castings.*
        FROM castings
        WHERE movie_id = $1"
        values = [@id]
        casts = SqlRunner.run(sql, values)
        sum = casts.reduce(0) { |sum, cast| sum += Casting.new(cast).fee.to_i }
        return  @budget - sum
      end
    end
