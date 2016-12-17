# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# config/environment.rb

# [...]

# Initialize default meta tags.
DEFAULT_META = YAML.load_file(Rails.root.join('config/meta.yml'))

# Plugin to enable Google Analytics

# Rubaidh::GoogleAnalytics.tracker_id = 'UA-63609634-2'
# Rubaidh::GoogleAnalytics.legacy_mode = true
