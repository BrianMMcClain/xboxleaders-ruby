require 'json'
require 'rest_client'

module XboxLeaders

	class Profile

		attr_accessor :gamertag, :tier, :xboxlaunchteam, :nxelaunchteam, :kinectlaunchteam, :avatar_full, :avatar_small, 
			:avatar_large, :avatar_tile, :gamerscore, :reputation, :presence, :online, :motto, :name, :location, :biography,
			:recentactivity, :base_url

		def initialize
			@base_url = "https://www.xboxleaders.com/api"
		end

		def self.from_gamertag(gamertag, base_url="https://www.xboxleaders.com/api")
			req_url = "#{base_url}/profile.json?gamertag=#{URI::encode(gamertag)}"
			j = RestClient.get req_url
			profile = from_json(j)
			return profile
		end

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

			profile.recentactivity = []

			if jobj['data']['recentactivity'].nil?
				profile.recentactivity = nil
			else
				jobj['data']['recentactivity'].each do |game_hash|
					game = XboxLeaders::Game.from_hash(game_hash, profile.gamertag)
					profile.recentactivity << game
				end
			end

			return profile
		end

		def games
			#https://www.xboxleaders.com/api/games.json?gamertag=AltarCrystal
			req_url = "#{@base_url}/games.json?gamertag=#{URI::encode(gamertag)}"
			j = RestClient.get req_url
			gamesobj = JSON.parse(j)
			games_hash = gamesobj['data']['games']
			games = []

			games_hash.each do |game_hash|
				game = XboxLeaders::Game.from_hash(game_hash, @gamertag)
				games << game
			end

			return games
		end

	end
end