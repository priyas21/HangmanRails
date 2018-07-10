require "rails_helper"

RSpec.describe Game, :type => :model do
  describe "Associations" do
    it { should have_many(:guesses) }
  end
  
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end