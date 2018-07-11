require "rails_helper"

RSpec.describe Guess, :type => :model do
  describe "Associations" do
    it {is_expected.to belong_to(:game) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:letter) }

    it { is_expected.to validate_uniqueness_of(:letter).scoped_to(:game_id) }

    it { is_expected.to allow_value('a').for(:letter) }

    it { is_expected.to_not allow_values(1, '@', 'jhgjh').for(:letter) }
  end
end
