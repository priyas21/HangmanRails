require "rails_helper"

RSpec.describe Guess, :type => :model do
  describe "Associations" do
    it {should belong_to(:game) }
  end

  describe "Validations" do
    it { should validate_presence_of(:letter) }

    it { should validate_uniqueness_of(:letter).scoped_to(:game_id) }
  end
end
