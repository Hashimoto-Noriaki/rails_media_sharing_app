require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsMediaSharingApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.time_zone = 'Asia/Tokyo'
    config.i18n.default_locale = :ja
    # Configuration for the application, engines, and railties goes here.
    config.generators do |g|
      g.jbuilder false
      g.javascripts false
      g.stylesheets false
      g.helper false
      g.test_framework false
    end
  end
end
