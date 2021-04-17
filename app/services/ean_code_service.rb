# frozen_string_literal: true

require 'net/http'

class EanCodeService
  def initialize(code)
    @code = code
  end

  def details
    url = URI.parse("http://skraper.dajcie.dla.mnie.sex.pl/#{@code}")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) do |http|
      http.request(req)
    end
    JSON.parse(res.body)
  end
end
