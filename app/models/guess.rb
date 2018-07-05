class Guess < ApplicationRecord
  belongs_to :game
  validates :guessed_letter, presence: true,
            format: { with: /\A[a-zA-Z]+\z/ },
            uniqueness: { scope: :game_id }
    
  
end
