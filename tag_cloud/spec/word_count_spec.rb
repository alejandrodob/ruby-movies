require_relative '../read_movies'
require_relative '../../movies'

movies = read_movies('../movies.csv')

movies_no_description = Catalog.new
movies_no_description.add(Movie.new("Batman", :heroes, 1989))
movies_no_description.add(Movie.new("Superman", :heroes, 1978))
movies_no_description.add(Movie.new("The Hobbit", :fantasy, 2012))
movies_no_description.add(Movie.new("The Godfather, Part I", :action, 1980))
movies_no_description.add(Movie.new("The Godfather, Part II", :action, 1982))
movies_no_description.add(Movie.new("Mary Poppins", :boring, 1960))
movies_no_description.add(Movie.new("Rambo", :action, 1980))
movies_no_description.add(Movie.new("Dumbo", :kids, 1960))
movies_no_description.add(Movie.new("Dumbo Remastered", :kids, 1960))
movies_no_description.add(Movie.new("Rambo II", :action, 1982))

describe "word_count" do
	it "counts no words if there is only one movie having no description" do
		single_no_des = Catalog.new
		single_no_des.add(Movie.new("Batman", :heroes, 1989))
		expect(word_count(single_no_des)).to eq({})
	end

	it "counts one word for a catalog with a one-description movie" do
		one_des = Catalog.new
		one_des.add(Movie.new("Batman", :heroes, 1989, "Epic"))
		expect(word_count(one_des)).to eq({"Epic" => 1})
	end

	it "counts two different words in a one-movie catalog" do
		two_words = Catalog.new
		two_words.add(Movie.new("Batman", :heroes, 1989, "Once upon"))
		expect(word_count(two_words)).to eq({"Once" => 1, "upon" => 1})
	end

	it "counts the same word twice in a single movie catalog" do
		twice = Catalog.new
		twice.add(Movie.new("Batman", :heroes, 1989, "Once Once"))
		expect(word_count(twice)).to eq({"Once" => 2})
	end

	it "counts different words in multi-movie catalogs" do
		twice = Catalog.new
		twice.add(Movie.new("Batman", :heroes, 1989, "Once upon"))
		twice.add(Movie.new("Rambo II", :action, 1982, "John Rambo"))
		expect(word_count(twice)).to eq({ "Once" => 1,
										  "upon" => 1,
										  "John" => 1,
										  "Rambo" => 1})
	end

	it "counts different words in multi-movie catalogs with mixed apearances" do
		twice = Catalog.new
		twice.add(Movie.new("Batman", :heroes, 1989, "Once upon Rambo"))
		twice.add(Movie.new("Rambo II", :action, 1982, "John upon Rambo"))
		expect(word_count(twice)).to eq({ "Once" => 1,
										  "upon" => 2,
										  "John" => 1,
										  "Rambo" => 2})
	end

	it "deletes trash characters like commas" do
		twice = Catalog.new
		twice.add(Movie.new("Batman", :heroes, 1989, "Once, upon Rambo''?? (Rambo)?"))
		expect(word_count(twice)).to eq({ "Once" => 1,
										  "upon" => 1,
										  "Rambo" => 2 })
	end


end