require 'debugger'
require 'active_support/core_ext/object'

require './lib/argument_parser'
require './lib/mixpanel'
require './lib/vero'

class MixpanelToVero
  def self.run(*args)
    puts "Starting MixpanelToVero..."
    new.fetch_data(ArgumentParser.parse(args))
  end

  def initialize
    @mixpanel = Mixpanel.new
    @vero = Vero.new
  end

  def fetch_data(params)
    @mixpanel.api_key    = params.delete("api_key")
    @mixpanel.api_secret = params.delete("api_secret")
    exported_data        = @mixpanel.export(params)
    puts "Fetched #{exported_data.length} records from Mixpanel."

    @vero.save_events_csv(exported_data)
  end
end