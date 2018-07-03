class Guess < ApplicationRecord
  belongs_to :game
  validates :guessed_letter, presence: true
  validates_format_of :guessed_letter, :with => /\A[A-Za-z]\z/
end
