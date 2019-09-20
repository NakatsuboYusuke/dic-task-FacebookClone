require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Lookbookapp
  class Application < Rails::Application
    config.load_defaults 5.2
    # change erb to slim
    config.generators.template_engine = :slim
    # set time_zone
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    # convert english to japaneses => 修正
    config.i18n.default_locale = :ja

    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
  end
end
