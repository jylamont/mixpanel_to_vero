require 'debugger'
require 'active_support/core_ext/object'

require './lib/mixpanel'
require './lib/vero'

class MixpanelToVero
  def self.run(*args)
    args = parse_arguments(args)
    new(args)
  end

  def initialize(args)
    mixpanel = Mixpanel.new
    mixpanel.api_key = args.delete("api_key")
    mixpanel.api_secret = args.delete("api_secret")

    exported_data = mixpanel.export(args)

    vero = Vero.new
    vero.save_events_csv(exported_data)
  end

  private
  def parse_arguments(args)
    args.flatten.map do |s|
      [$1, $2] if s =~ /(.+)=(.+)/
    end.reject(&:nil?).each_with_object({}) do |i, hash|
      hash[i.first] = i.last
    end
  end
end