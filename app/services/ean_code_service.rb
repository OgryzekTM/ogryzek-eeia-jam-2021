# frozen_string_literal: true

require 'net/http'

class EanCodeService
  def initialize(code)
    @code = code
  end

  def get_details
    url = URI.parse("http://www.example.com/#{@code}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    puts res.body
  end
end
