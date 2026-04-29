ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require "bundler/setup" # Set up gems listed in the Gemfile.

begin
  require "bootsnap/setup" unless ENV["DISABLE_BOOTSNAP"] == "1"
rescue StandardError => e
  warn "Bootsnap disabled: #{e.class}: #{e.message}"
end
