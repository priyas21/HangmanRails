require 'rails_helper'

RSpec.describe GuessesController, :type => :controller do

  describe "#create" do
    let(:name) { "Lilly" }
    let(:letter) { "s" }
    game = Game.create!(:name => name)
    let(:guess) { post :create, :params => {:guess => {:letter => letter}, :game_id => game.to_param  } }

    context "when guess is valid" do
      before do
        guess
      end

      it "create @guess" do
        expect(game.guesses.count).to eq 1
        expect(game.guesses.last.letter).to eq letter
      end

      it "flashes a success messages" do
        expect(flash[:success]).to eq "The guess is valid"
      end

      it "redirects to show action" do
        expect(guess).to redirect_to("/games/#{ assigns(:game).id }")
      end
    end

    context "when guess is invalid" do
      let(:letter) { '@' }
      before do
        guess
      end

      it "flashes an error message" do
        expect(flash[:notice]).to eq ["Letter is invalid"]
      end
    end

    context "when guess is duplicate" do
      let(:letter) { "s" }
      before do
        post :create, :params => {:guess => {:letter => letter}, :game_id => game.to_param  }
        post :create, :params => {:guess => {:letter => letter}, :game_id => game.to_param  }
      end

      it "flashes an alert message for duplicate guess" do
        expect(flash[:notice]).to eq ["Letter has already been taken"]
      end

      it "redirects to show action" do
        expect(guess).to redirect_to("/games/#{ assigns(:game).id }")
      end
    end
  end
end
