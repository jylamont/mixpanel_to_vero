require 'rest-client'
require 'active_support/core_ext/numeric'

class Mixpanel
  attr_accessor :api_key, :api_secret

  def export(options = {})
    if valid?
      query = build_request_query(options)
      response = RestClient.get "https://data.mixpanel.com/api/2.0/export?#{query}"

      s = "[#{response.gsub("\n", ",")[0...-1]}]"
      JSON(s)
    else
      raise "#{self.class.name} has not been configure. Please provide a api_key and api_secret."
    end
  end

  private
  def valid?
    !(api_key.blank? || api_secret.blank?)
  end

  def expire
    (10.minutes.from_now).to_i
  end

  def build_request_query(options = {})
    options.merge!("api_key" => api_key, "expire" => expire)

    options = options.keys.sort.map { |k| "#{k}=#{options[k]}" }

    sig = Digest::MD5.hexdigest(options.join("") + api_secret)
    options << "sig=#{sig}"

    options.join("&")
  end
end