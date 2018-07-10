require "rails_helper"

RSpec.describe Guess, :type => :model do
  it {should belong_to(:game) }
  
  it { should validate_presence_of(:letter) }

  it { should validate_uniqueness_of(:letter).scoped_to(:game_id) }

  # it { should validate_format_of(:letter).with(/\A[a-zA-Z]\z/) }
end
