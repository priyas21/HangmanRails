require "rails_helper"

RSpec.describe Game, :type => :model do
  let(:name) { 'Lilly' }

  subject(:game) { Game.create(:name => name,
          :initial_number_of_lives => 8, :word => 'Rails' )}

  describe "Associations" do
    it { should have_many(:guesses) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  context "at start of game" do
    describe "#guessed_letters" do
      it "will have no guesses" do
        expect(game.guessed_letters).to eq []
      end
    end

    describe "#clue" do
      it "will build the initial clue" do
        expect(game.clue).to eq [nil] * game.word.length
      end
    end

    describe "#remaining_lives" do
      it "will show the initial number of lives" do
        expect(game.remaining_lives).to eq game.initial_number_of_lives
      end
    end

    describe "#in_progress?" do
      it "returns true" do
        expect(game).to be_in_progress
      end
    end

    describe "#won?" do
      it "returns false" do
        expect(game).not_to be_won
      end
    end

    describe "#lost?" do
      it "returns false" do
        expect(game).not_to be_lost
      end
    end
  end

  context "during the game" do
    describe "#guessed_letters" do
      it "will have the valid guess" do
        guess = game.guesses.create!( [{:letter => "i"}, {:letter => "l"}] )
        expect(game.guessed_letters).to eq ([guess[0].letter, guess[1].letter])
      end
    end

    describe "#clue" do
      context "when the correct guess is made" do
        it "will add the guesses to the clue" do
          guess = game.guesses.create!( [{:letter => "i"}, {:letter => "l"}] )
          expect(game.clue).to eq [nil, nil, 'i', 'l', nil]
        end
      end

      context "when the incorrect guess is made" do
        it "will not make any changes to the clue" do
           guess = game.guesses.create!( [{:letter => "q"}, {:letter => "m"}] )
          expect(game.guessed_letters).to eq ([guess[0].letter, guess[1].letter])
        end
      end
    end

    describe "#remaining_lives" do
      context "when the correct guess is made" do
        it "will not change the remaining_lives" do
          guess = game.guesses.create!( [{:letter => "r"}, {:letter => "l"}] )
          expect(game.remaining_lives).to eq 8
        end
      end

       context "when the incorrect guess is made" do
        it "will not decrement the remaining_lives by 1" do
          guess = game.guesses.create!( [{:letter => "q"}, {:letter => "m"}] )
          expect(game.remaining_lives).to eq 6
        end
      end
    end
  end
end
