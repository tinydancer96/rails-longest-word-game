class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a * 2
    vowels = ('aeiou').chars * 4
    @letters = alphabet.sample(6) + vowels.sample(4)
  end

  def score
    raise
  end
end
