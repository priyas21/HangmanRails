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
end