# Your TextAnalyzer model code will go here.
class TextAnalyzer
  attr_reader :text
 
  def initialize(text)
    @text = text.downcase
    # eliminates the need for the range [^a-zA-Z]
  end
 
  def count_of_words
    words = text.split(" ")
    words.count
  end
 
  def count_of_vowels
    text.scan(/[aeoui]/).count
  end
 
  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end
 
  def most_used_letter
    # better to use [^a-zA-Z] to not eliminate spaces and uppercase letters
    s1 = text.gsub(/[^a-z]/, '') # gets rid of spaces
    arr = s1.split('') #splits every letter from the string into an array of letter elements
    arr1 = arr.uniq #gathers the uniq letter or elements from the array
    arr2 = {}
 
    # takes each unique letter and makes a key out of it 
    # and assigns the value of it's count from the original array
    arr1.map do |c|
      arr2[c] =  arr.count(c)
    end
 
    # creates a starter hash using the first key pointing to the first value in the arr2 hash
    biggest = { arr2.keys.first => arr2.values.first }
 
    # as starting point, compares each key/value pair in arr2, and if any has a bigger value, 
    # reassigns the value of the biggest hash
    arr2.each do |key, value|
      if value > biggest.values.first
        biggest = {}
        biggest[key] = value
      end
    end
 
    # returns the biggest hash with the letter as the key, and the value of its count
    biggest
  end
end