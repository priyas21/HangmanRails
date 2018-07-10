require "rails_helper"

RSpec.describe Guess, :type => :model do
  it { should validate_presence_of(:letter) }
end
