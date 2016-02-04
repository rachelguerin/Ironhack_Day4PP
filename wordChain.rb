require 'ruby-dictionary'

class WordChain
	def initialize(dictionary)
		@dictionary = dictionary
		@words = []
	end

	def find_chain(start,finish)
		if start.length != finish.length
			puts "Words must be the same length."
		else
			puts start
			fArray = finish.chars
			if start != finish
				fArray.each_with_index do |fletter,i|
					#if sarray firstletter replace fletter is a word
					newWordArray = start.chars
					newWordArray[i] = fletter
					newWord = newWordArray.join
					if @dictionary.exists?(newWord) && !@words.include?(newWord)
						@words << newWord
						find_chain(newWord,finish)
						break
					end
				end
			end
		end
	end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")

my_chain = WordChain.new(dictionary)

puts "Give me a word"
firstWord = gets.chomp

puts "Give me another word"
secondWord = gets.chomp

my_chain.find_chain(firstWord, secondWord)

