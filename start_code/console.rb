require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')

 movie1 = Movie.new({'title' => 'Predator', 'genre' => 'Action', 'budget' => 300})
 movie2 = Movie.new({'title' => 'Conan the Barbarian', 'genre' => 'Dark Fantasy', 'budget' => 120})

movie1.save()
movie2.save()

star1 = Star.new({'first_name' => 'Arnold', 'last_name' => 'Schwarzenegger'})
star2 = Star.new({'first_name' => 'Jesse', 'last_name' => 'Ventura'})
star3 = Star.new({'first_name' => 'Jed', 'last_name' => 'Nobaura'})

star1.save()
star2.save
star3.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => 200})
casting2 = Casting.new({'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => 10})
casting3 = Casting.new({'movie_id' => movie1.id, 'star_id' => star3.id, 'fee' => 40})
casting3a = Casting.new({'movie_id' => movie2.id, 'star_id' => star1.id, 'fee' => 100})

casting1.save()
casting2.save()
casting3.save()
casting3a.save()
p movie1.remaining_budget()
# p movie1.stars().first.first_name
# p star1.movies
