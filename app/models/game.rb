class Game < ApplicationRecord
  has_many :guesses
  validates :name, presence: true
end
