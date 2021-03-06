require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhimmoiClone
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.assets.js_compressor = Uglifier.new(harmony: true)
    config.i18n.fallbacks = [:en]
    config.i18n.default_locale = :vi
    config.i18n.available_locales = [:vi, :en]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images', 'covers')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images', 'gallery')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images', 'home')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images', 'partners')
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'images', 'section')
