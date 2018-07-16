require "rails_helper"

RSpec.describe Game, :type => :model do
  let(:name) { 'Lilly' }
  let(:lives) { 8 }

  subject(:game) { Game.create!(:name => name,
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
          expect(game.clue).to eq [nil, nil, nil, nil, nil]
        end
      end
    end

    describe "#remaining_lives" do
      context "when the correct guess is made" do
        it "will not change the remaining_lives" do
          game.guesses.create!( [{:letter => "r"}, {:letter => "l"}] )
          expect(game.remaining_lives).to eq lives
        end
      end

       context "when the incorrect guess is made" do
        it "will decrement the remaining_lives by 1" do
          game.guesses.create!( [{:letter => "q"}] )
          expect(game.remaining_lives).to eq lives - 1
        end
      end
    end

    describe "#in_progress" do
      context "when the game is neither won nor lost" do
        it "returns true" do
          game.guesses.create!( [{:letter => "q"}, {:letter => "m"},
            {:letter => "e"},{:letter => "r"}, {:letter => "y"} ] )
          expect(game).to be_in_progress
        end
      end

      context "when the game is won but not lost" do
        it  "returns false" do
          game.guesses.create!( [{:letter => "a"}, {:letter => "m"},
            {:letter => "e"},{:letter => "r"}, {:letter => "y"}, {:letter => "l"},
            {:letter => "i"}, {:letter => "s"}] )
          expect(game).not_to be_in_progress
        end
      end

       context "when the game is lost but not won" do
        it  "returns false" do
          game.guesses.create!( [{:letter => "q"}, {:letter => "m"},
            {:letter => "g"},{:letter => "f"}, {:letter => "c"}, {:letter => "x"},
            {:letter => "n"}, {:letter => "t"}] )
          expect(game).not_to be_in_progress
        end
      end
    end

    describe "#won" do
      context "when lives are remaining" do
        let(:lives) { 6 }

        context "and the word is guessed" do
          it "returns true" do
            game.guesses.create!( [{:letter => "i"}, {:letter => "m"},
              {:letter => "r"},{:letter => "a"}, {:letter => "c"}, {:letter => "s"},
              {:letter => "l"}, {:letter => "t"}] )
            expect(game).to be_won
          end
        end

        context "and the word is not guessed" do
          it "returns true" do
            game.guesses.create!( [{:letter => "q"}, {:letter => "m"},
              {:letter => "g"},{:letter => "f"}, {:letter => "c"}, {:letter => "x"}] )
            expect(game).not_to be_won
          end
        end
      end

      context "when no lives are remaining" do
        let(:lives) { 0 }

        context "and the word is not guessed" do
          it "returns false" do
            game.guesses.create!( [{:letter => "q"}, {:letter => "m"},
              {:letter => "g"},{:letter => "f"}, {:letter => "c"}, {:letter => "x"},
              {:letter => "d"}, {:letter => "h"}] )
            expect(game).not_to be_won
          end
        end
      end
    end

    describe "#lost" do
      context "when lives are remaining" do
        let(:lives) { 6 }

        context "and the word is guessed" do
          it "returns false" do
            game.guesses.create!( [{:letter => "i"}, {:letter => "m"},
              {:letter => "r"},{:letter => "a"}, {:letter => "c"}, {:letter => "s"},
              {:letter => "l"}, {:letter => "t"}] )
            expect(game).not_to be_lost
          end
        end

        context "and the word is not guessed" do
          it "returns false" do
            game.guesses.create!( [{:letter => "q"}, {:letter => "m"},
              {:letter => "g"},{:letter => "a"}, {:letter => "c"}, {:letter => "x"}
              ] )
            expect(game).not_to be_lost
          end
        end
      end

      context "when no lives are remaining" do
        let(:lives) { 0 }

        context "and the word is not guessed" do
          it "returns true" do
            game.guesses.create!( [{:letter => "q"}, {:letter => "m"},
              {:letter => "g"},{:letter => "f"}, {:letter => "c"}, {:letter => "x"},
              {:letter => "d"}, {:letter => "h"}] )
            expect(game).to be_lost
          end
        end
      end
    end
  end
end
