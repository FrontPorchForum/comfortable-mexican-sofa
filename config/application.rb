# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ComfortableMexicanSofa
  class Application < Rails::Application

    require_relative "../lib/comfortable_mexican_sofa"

    config.load_defaults 7.0
    Rails.application.config.active_storage.variant_processor = :mini_magick

    # YAML serialization is used for revisions that include various Ruby
    # classes that aren't supported by YAML's safe_load method by default.
    # Make them so.
    #
    # Note that this (re)introduces a potential security hole (though exactly
    # which classes are potentially unsafe to deserialize and why isn't clear).
    config.active_record.yaml_column_permitted_classes = [
      ActiveSupport::HashWithIndifferentAccess,
      ActiveSupport::SafeBuffer,
      ActiveSupport::TimeWithZone,
      ActiveSupport::TimeZone,
      Symbol,
      Time
    ]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Ensuring that all ActiveStorage routes are loaded before out globbing route.
    config.railties_order = [ActiveStorage::Engine, :main_app, :all]

    # Making sure we don't load our dev routes as part of the engine
    config.paths["config/routes.rb"] << "config/cms_routes.rb"

    config.i18n.enforce_available_locales = true
    config.i18n.raise_on_missing_translations = true
    config.action_view.form_with_generates_remote_forms = true

  end
end
