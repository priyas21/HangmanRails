require "rails_helper"

RSpec.describe Game, :type => :model do
  it "is not created without a name" do
    game = Game.new(name: nil)
    expect(game).to_not be_valid
  end

  it "is created with a name" do
    game = Game.new(name: "Lilly")
    expect(game).to be_valid
  end
end