require 'json'

module XboxLeaders

	class Profile

		attr_accessor :gamertag, :tier, :xboxlaunchteam, :nxelaunchteam, :kinectlaunchteam, :avatar_full, :avatar_small, 
			:avatar_large, :avatar_tile, :gamerscore, :reputation, :presence, :online, :motto, :name, :location, :biography

		def self.from_json(raw_json)
			jobj = JSON.parse(raw_json)

			profile = XboxLeaders::Profile.new
			profile.gamertag = jobj['data']['gamertag']
			profile.tier = jobj['data']['tier']
			profile.xboxlaunchteam = jobj['data']['badges']['xboxlaunchteam']
			profile.nxelaunchteam = jobj['data']['badges']['nxelaunchteam']
			profile.kinectlaunchteam = jobj['data']['badges']['kinectlaunchteam']
			profile.avatar_full = jobj['data']['avatar']['full']
			profile.avatar_small = jobj['data']['avatar']['small']
			profile.avatar_large = jobj['data']['avatar']['large']
			profile.avatar_tile = jobj['data']['avatar']['tile']
			profile.gamerscore = jobj['data']['gamerscore']
			profile.reputation = jobj['data']['reputation']
			profile.presence = jobj['data']['presence']
			profile.online = jobj['data']['online']
			profile.motto = jobj['data']['motto']
			profile.name = jobj['data']['name']
			profile.location = jobj['data']['location']
			profile.biography = jobj['data']['biography']

			return profile
		end

	end
end