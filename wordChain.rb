require 'ruby-dictionary'
require 'pry'
class WordChain
	def initialize(dictionary)
		@dictionary = dictionary
	end

	def find_chain(start,finish)
		if start.length != finish.length
			puts "Words must be the same length."
		else
			find_next_word(start,finish)
		end
	end

	def find_next_word(start,finish)
		fArray = finish.chars
		if start != finish
			fArray.each_with_index do |fletter,i|
				#if sarray firstletter replace fletter is a word
				newWordArray = start.chars
				newWordArray[i] = fletter
				newWord = newWordArray.join
				if @dictionary.exists? newWord
					#found a word! 
					binding.pry
					puts newWord
					find_next_word(newWord,finish)
					break
				end
			end
		end
	end
end

dictionary = Dictionary.from_file("/usr/share/dict/words")

my_chain = WordChain.new(dictionary)

my_chain.find_chain("cat","dog")

