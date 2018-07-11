require "rails_helper"

RSpec.describe WelcomeController, :type => :controller do
  it { is_expected.to route(:get, '/welcome/index').to(action: :index)}
end