require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  describe "GET index" do
    it "should get index page" do
      get :index
      expect(response.status).to eq(200)
    end
  end
end