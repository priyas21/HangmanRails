require "rails_helper"

RSpec.describe Game, :type => :model do
  let(:name) { 'Lilly' }

  subject(:game) { Game.new(:name => name,
          :initial_number_of_lives => 8, :word => 'Rails' )}

  describe "Associations" do
    it { should have_many(:guesses) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end