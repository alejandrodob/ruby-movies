require_relative '../movies'

movies = Catalog.new
movies.add(Movie.new("Batman", "Action", 1989))
movies.add(Movie.new("Superman", "Action", 1980))
movies.add(Movie.new("The Hobbit", "Fantasy", 2013))
movies.add(Movie.new("The Godfather, Part I", "Action", 1979))
movies.add(Movie.new("Mary Poppins", "Boring", 1965))
movies.add(Movie.new("Rambo", "Action", 1983))
movies.add(Movie.new("Dumbo", "Kids", 1960))

sample_movies = ["Batman", "Superman", "The Hobbit",
				"The Godfather, Part I", "Mary Poppins", "Rambo", "Dumbo"]

describe '.movies' do 
	it "takes last movie" do	
		expect(movies.movies(1)[0].title).to eq(sample_movies[0])
	end	
	it "takes last 4 movies" do
		expect(movies.movies(4).map{|movie| movie.title}).to eq(sample_movies.take(4))
	end
	it "takes all the movies" do
		expect(movies.movies().map{|movie| movie.title}).to eq(sample_movies)
	end
end