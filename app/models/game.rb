class Game < ApplicationRecord
  has_many :guesses, dependent: :destroy
  validates :name, presence: true
end
