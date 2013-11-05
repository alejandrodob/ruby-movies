require_relative '../movies'


#sample_movies = ["Batman", "Dumbo", "Mary Poppins",
#				"Rambo", "Superman", "The Godfather, Part I", "The Hobbit"]
#
#sample_movies_reverse = ["The Hobbit", "The Godfather, Part I", "Superman", "Rambo",
#				"Mary Poppins", "Dumbo", "Batman"]		

	movies = Catalog.new
	movies.add(Movie.new("Batman", :heroes, 1989))
	movies.add(Movie.new("Superman", :heroes, 1978))
	movies.add(Movie.new("The Hobbit", :fantasy, 2012))
	movies.add(Movie.new("The Godfather, Part I", :action, 1980))
	movies.add(Movie.new("The Godfather, Part II", :action, 1982))
	movies.add(Movie.new("Mary Poppins", :boring, 1960))
	movies.add(Movie.new("Rambo", :action, 1980))
	movies.add(Movie.new("Dumbo", :kids, 1960))
	movies.add(Movie.new("Dumbo Remastered", :kids, 1960))
	movies.add(Movie.new("Rambo II", :action, 1982))


describe '.histogram' do
	it "returns an empty histogram in case no movies of that genre" do
		movies_empty = Catalog.new
		expect(movies_empty.histogram(:terror)).to eq({})
	end

	it "returns 1 movies in year 1960 for genre Boring" do
		expect(movies.histogram(:boring)).to eq({1960 => 1})
	end

	it "returns 2 movies in year 1960 for genre :kids" do
		expect(movies.histogram(:kids)).to eq({1960 => 2})
	end

	it "returns 2 movies in different years for genre: heroes" do
		expect(movies.histogram(:heroes)).to eq({1989 => 1, 1978 => 1})
	end

	it "returns 2 movies in 2 different years for genre: action" do
		expect(movies.histogram(:action)).to eq({1980 => 2, 1982 => 2})
	end

end
