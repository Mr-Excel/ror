require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Lms
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Asia/Karachi"
    # config.eager_load_paths << Rails.root.join("extras")
    config.build_production_command = "RAILS_ENV=production NODE_ENV=production bin/webpacker"
    # config.action_view.javascript_expansions[:defaults] = %w(jquery.min jquery_ujs)
    config.generators do |g|
      g.test_framework(
        :rspec,
        fixture: false,
        view_specs: false,
        helper_specs: false,
        )
    end
    # Rails.application.config.assets.paths << Rails.root.join('app', 'javascript', 'pack')

  end
end
