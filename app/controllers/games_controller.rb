require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a * 2
    vowels = ('aeiou').chars * 4
    @letters = alphabet.sample(7) + vowels.sample(3)
  end

  def score
    @word = params[:guess]
    english_word

    @result = ""

     if !@letters.include?(@word)
       @result = "Your word can't be built from the list!"
       raise
     elsif @hash_api == false
       @result = "Your word is not a valid English word!"
     else
       @result = "Congrats! #{@word} is a valid English word!"
     end

    @result
  end

  private

  def overused?
    @word.chars.all? { |char| attempt.count(char) <= @letters.count(char) }
  end

  def english_word
    api_url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    html = URI.open(api_url).read
    @hash_api = JSON.parse(html)
  end
end
