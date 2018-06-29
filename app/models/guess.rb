class Guess < ApplicationRecord
  belongs_to :game
  # validates :guessed_letter, presence: true
end
