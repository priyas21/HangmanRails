require 'rails_helper'

RSpec.describe GamesController, :type => :controller do
  it { is_expected.to route(:get, '/games').to(action: :index) }

  it { is_expected.to route(:post, '/games').to(action: :create) }

  it { is_expected.to route(:get, '/games/new').to(action: :new) }

  it { is_expected.to route(:get, 'games/60').to(action: :show, id: 60)}

  describe "GET index" do
    it "assigns @game" do
      game = Game.create!(:name => 'ppp')
      get :index
      expect(assigns(:games)).to eq([game])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "#new" do
    context "when initialized" do
      it "is a new game" do
         game = Game.new
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
    subject { post :create, :params => {:game => {:name => "Jiya" } } }

    it "creates @game" do
      expect{subject}.to change{Game.count}.by(1)
    end

    it "redirects_to show template if the game is successfully saved" do
      expect(subject).to redirect_to :action => :show, :id => assigns(:game).id
    end

    it "renders the new template if the game is not successfully saved" do
      post :create, :params => { :game => {:name => ""}}
      expect(response).to render_template("new")
    end
  end

end