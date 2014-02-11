require 'rest-client'
require 'uri'

module XboxLeaders

	class Client

		attr_reader :base_url

		def initialize(base_url = "https://www.xboxleaders.com/api")
			@base_url = base_url
		end

		def profile(gamertag)
			req_url = "#{@base_url}/profile.json?gamertag=#{URI::encode(gamertag)}"
			puts req_url
			j = RestClient.get req_url
			profile = XboxLeaders::Profile.from_json(j)
			return profile
		end
	end

end