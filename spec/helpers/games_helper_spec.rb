require 'rails_helper'

RSpec.describe GamesHelper, :type => :helper do
  describe "#show_clue" do
    let(:clue) { [nil, 'a', nil, nil, 't'] }
    let(:formated_clue) { "\u{1f60E} a \u{1f60E} \u{1f60E} t" }

    it "returns the fomatted clue" do
      expect(helper.show_clue(clue)).to eq formated_clue
    end
  end

  describe "#game_progress" do
    let(:game) { Game.create!(:name => "lilly", :word => "Rails") }

    context "when game is in progress" do
      it "returns number of lives remaining" do
        allow(game).to receive(:remaining_lives).and_return(5)
        allow(game).to receive(:in_progress?).and_return(true)
        expect(helper.game_progress(game)).to eq "5 lives remaining"
      end
    end

    context "when game is won" do
      it "displays the won message" do
        allow(game).to receive(:in_progress?).and_return(false)
        allow(game).to receive(:won?).and_return(true)
        expect(helper.game_progress(game)).to eq "You have won the game"
      end
    end


    context "when game is lost" do
      it "displays the lost message" do
        allow(game).to receive(:in_progress?).and_return(false)
        allow(game).to receive(:won?).and_return(false)
        expect(helper.game_progress(game)).to eq "Sorry, you've run out of lives!"
      end
    end
  end
end
