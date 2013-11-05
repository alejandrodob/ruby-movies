require_relative '../movies'
def read_movies(file)
	movs_array = []
	File.open(file).each do |line|
		movs_array << line.split('#')
	end
	movs_array
end

def word_count(catalog)
	words_freq = {}
	words = descriptions_to_array(catalog)
	words.each do |word|
		words_freq[word] ||= 0
		words_freq[word] += 1
	end
	words_freq
end

def descriptions_to_array(catalog)
	words = []
	catalog.movies.each do |movie|
		movie.description.split(" ").each do |word|
			words << word
		end
	end
	words
end
