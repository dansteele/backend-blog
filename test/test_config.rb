RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

require 'database_cleaner'
require 'factories'

class MiniTest::Spec
  include Rack::Test::Methods
  include FactoryGirl::Syntax::Methods

  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app BlogBackend::App
  #   app BlogBackend::App.tap { |a| }
  #   app(BlogBackend::App) do
  #     set :foo, :bar
  #   end
  #
  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end

  def setup
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end
