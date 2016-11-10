require 'bundler/setup'
require 'pakyow'

Pakyow::App.define do
  configure do
    Bundler.require :default, Pakyow::Config.env

    if defined?(Dotenv)
      env_path = ".env.#{Pakyow::Config.env}"
      Dotenv.load env_path if File.exist?(env_path)
      Dotenv.load
    end

    app.name = 'image-upload'

    CarrierWave.configure do |config|
      config.root = File.join(
        File.expand_path(app.root),
        'public'
      )
    end

    Sequel::Model.plugin :timestamps, update_on_create: true
    app.db = Sequel.connect(ENV['DATABASE_URL'])
  end

  configure :development do
    # development config goes here
  end

  configure :production do
    # production config goes here
  end
end
