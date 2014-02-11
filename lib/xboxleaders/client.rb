require 'rest-client'
require 'uri'

module XboxLeaders

	class Client

		attr_reader :base_url

		def initialize(base_url = "https://www.xboxleaders.com/api")
			@base_url = base_url
		end

		def profile(gamertag)
			profile = XboxLeaders::Profile.from_gamertag(gamertag, @base_url)
			return profile
		end
	end

end