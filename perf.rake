class SorceryAuth < DerailedBenchmarks::AuthHelper
  def setup
    require 'sorcery'
    require 'sorcery/controller'
    # extend ::Sorcery::TestHelpers::Rails::Controller
    # extend ::Sorcery::TestHelpers::Rails::Request
    extend ::Sorcery::TestHelpers::Rails::Integration
    extend ::Sorcery::Controller::InstanceMethods
    # initialize code here
  end

  def call(env)
    # log something in on each request
    user = User.first_or_create!(email: 'test@test.email', password: '1234')
    # login(user.email, '1234', remember_me = false)
    login_user(user, '1234', 'user_sessions')
    app.call(env)
  end
end

DerailedBenchmarks.auth = SorceryAuth.new