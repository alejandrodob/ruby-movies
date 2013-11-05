require_relative '../movies'

movies = Catalog.new
movies.add(Movie.new("Batman", :heroes, 1989))
movies.add(Movie.new("Superman", :heroes, 1978))
movies.add(Movie.new("The Hobbit", :fantasy, 2012))
movies.add(Movie.new("The Godfather, Part I", :action, 1980))
movies.add(Movie.new("Mary Poppins", :boring, 1960))
movies.add(Movie.new("Rambo", :action, 1980))
movies.add(Movie.new("Dumbo", :kids, 1960))

sample_movies = ["Batman", "Dumbo", "Mary Poppins",
				"Rambo", "Superman", "The Godfather, Part I", "The Hobbit"]

sample_movies_reverse = ["The Hobbit", "The Godfather, Part I", "Superman", "Rambo",
				"Mary Poppins", "Dumbo", "Batman"]		

describe '.order_movies' do
	it "orders all the movies in alphabetic order" do
		expect(movies.order.map {|movie| movie.title}).to eq(sample_movies)
	end

	it "orders all the movies in reverse alphabetic order" do
		expect(movies.order(false).map {|movie| movie.title}).to eq(sample_movies_reverse)
	end

end