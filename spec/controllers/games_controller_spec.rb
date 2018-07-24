require 'rails_helper'

RSpec.describe GamesController, :type => :controller do

    let!(:game) { Game.create!(:name => name, :word => word, :initial_number_of_lives => initial_number_of_lives) }
    let(:name) { "Jiya" }
    let(:word) { "Hillarious" }
    let(:initial_number_of_lives) { 8 }

  it { is_expected.to route(:get, '/games').to(action: :index) }

  it { is_expected.to route(:post, '/games').to(action: :create) }

  it { is_expected.to route(:get, '/games/new').to(action: :new) }

  it { is_expected.to route(:get, 'games/60').to(action: :show, id: 60)}


  describe "GET index" do

    it "assigns @game" do
      get :index
      expect(assigns(:games)).to eq Game.all
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#new" do
    context "when initialized" do
      it "is a new game" do
         get :new
        expect(assigns(:game)).to be_a_new(Game)
      end
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "#create" do
    let(:new_name) {"jiya"}
    let(:game_params) { {:game => {:name => new_name , :word => word, :initial_number_of_lives => initial_number_of_lives} } }
    let(:create_game) { post :create, :params => game_params}

    let(:build_game) { instance_double("BuildGame",:call => new_game )}
    let(:new_game) { Game.new(:name => name, :word => word, :initial_number_of_lives => initial_number_of_lives) }

    it "creates @game" do
      allow(BuildGame).to receive(:new).and_return(build_game)
      expect{create_game}.to change{Game.count}.by(1)
    end

    it "redirects_to show template if the game is successfully saved" do
      expect(create_game).to redirect_to :action => :show, :id => assigns(:game).id
    end

    context "when the name is missing" do
      let(:new_name) { "" }

      it "renders the new template if the game is not successfully saved" do
        create_game
        expect(response).to render_template("new")
      end
    end
  end

  describe "#destroy" do
    let(:delete_game) { delete :destroy, :params => { :id => game.to_param } }

    it "destroys @game" do
      expect{delete_game}.to change{Game.count}.by(-1)
    end

    it "redirects_to index template" do
      delete_game
      expect(response).to redirect_to :action => :index
    end
  end
end