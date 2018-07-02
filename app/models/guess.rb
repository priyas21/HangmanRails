class Guess < ApplicationRecord
  belongs_to :game
  validates :guessed_letter, presence: true,
            format: { with: /\A[A-Za-z]\z/,
            message: "only allows letters" }
end
