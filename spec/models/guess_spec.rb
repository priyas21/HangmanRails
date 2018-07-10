require "rails_helper"

RSpec.describe Guess, :type => :model do
  game = Game.new(name: "piu")
  subject(:guess) { game.guesses.new }
  
  context "with empty input" do
    it "is not valid" do
      guess.letter = nil
      expect(guess).to_not be_valid
    end
  end

  context "with input as number, special characters or multiple characters" do
    it "is not valid" do
      guess.letter = '@'
      expect(guess).to_not be_valid
    end
  end

  it "is valid with valid input" do
    guess.letter = "p"
    expect(guess).to be_valid
  end
end