class Guess < ApplicationRecord
  belongs_to :game
  before_validation :downcase_letter
  validates :letter, presence: true,
            format: { with: /\A[a-zA-Z]\z/ },
            uniqueness: { scope: :game_id }

  def downcase_letter
    self.letter.downcase!
  end
end
