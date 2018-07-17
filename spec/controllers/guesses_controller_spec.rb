require 'rails_helper'

RSpec.describe GuessesController, :type => :controller do

  describe "#create" do
    let(:name) { "Lilly" }
    let(:letter) { "s" }
    game = Game.create!(:name => name)
    let(:guess) { post :create, :params => {:guess => {:letter => letter}, :game_id => game.to_param  } }
