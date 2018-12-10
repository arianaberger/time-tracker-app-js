require_relative 'boot'

require 'rails/all'

# config.autoload_paths << "#{Rails.root}/lib"
# config.eager_load_paths << "#{Rails.root}/lib"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TimeTrackerApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths = ["#{config.root}/lib"] #gets my module working for entry and project models

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
