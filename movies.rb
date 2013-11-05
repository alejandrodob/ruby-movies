class Movie

	def initialize(title, genre, year, description = "")
		@title = title
		@genre = genre
		@year  = year
		@description = description
	end

	def title
		@title
	end

	def genre
		@genre
	end

	def year
		@year
	end

	def description
		@description
	end
		
end

class Catalog

	def initialize
		@movies = []
	end

	def movies
		@movies
	end

	def add(movie)
		@movies << movie
	end

	def movies(n = @movies.length)
		@movies.take(n)
	end

	def print_movies(movies = @movies)
		movies.each do |movie|
			puts movie.title
		end
	end

	def order(alphabetic = true)
		@movies.sort do |a, b|
			alphabetic ? a.title <=> b.title : b.title <=> a.title
		end
	end
	
	def histogram(genre)
		hist = {}
		movies.each do |movie|
			if  movie.genre == genre
				hist[movie.year] ||= 0
				hist[movie.year] += 1
			end
		end
		hist
	end


end


 