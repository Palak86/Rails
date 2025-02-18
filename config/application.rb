require_relative "boot"

require "rails/all"


# ActionDispatch::Callbacks.after do
#   # Reload the factories
#   return unless (Rails.env.development? || Rails.env.test?)

#   unless FactoryGirl.factories.blank? # first init will load factories, this should only run on subsequent reloads
#     FactoryGirl.factories.clear
#     FactoryGirl.find_definitions
#   end
# end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ecommerce
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.factory_bot.definition_file_paths = ["custom/factories"]

    
  end
end
