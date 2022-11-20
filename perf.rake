class SorceryAuth < DerailedBenchmarks::AuthHelper
  def setup
    require 'sorcery'
    require 'sorcery/controller'
    # extend ::Sorcery::TestHelpers::Rails::Controller
    # extend ::Sorcery::TestHelpers::Rails::Request
    # extend ::Sorcery::TestHelpers::Rails::Integration
    # extend ::Sorcery::Controller::InstanceMethods
    # initialize code here
  end

  def call(env)
    user = User.first_or_create!(email: 'test@test.email', password: '1234')
    auto_login(user)
    app.call(env)
  end
end

DerailedBenchmarks.auth = SorceryAuth.new