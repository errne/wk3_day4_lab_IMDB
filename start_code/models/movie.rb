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

      # def remaining_budget()
      #   sql = "SELECT *
      #   FROM castings
      #   WHERE movie_id = $1"
      #   values = [@id]
      #   money_spent = SqlRunner.run(sql, values)
      #   money_spent.map { |casting| Casting.new(casting) }
      #   return  money_spent.reduce(0, :+).to_i
      # end
    end
