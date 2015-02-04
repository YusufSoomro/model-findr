require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ModelFindrApp
  class Application < Rails::Application
    config.filepicker_rails.api_key = "Aj6UeHtuxTf2ro7P6it1Ez"
    config.active_record.raise_in_transactional_callbacks = true
  end
end
