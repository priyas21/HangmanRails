class Guess < ApplicationRecord
  belongs_to :game
  validates :letter, presence: true,
            length: {minimum: 1, maximum: 1},
            format: { with: /\A[a-zA-Z]\z/ },
            uniqueness: { scope: :game_id }


end
