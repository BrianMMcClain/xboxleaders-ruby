require 'json'
require 'date'

module XboxLeaders

	class Game

		attr_accessor :gamertag, :id, :hid, :isapp, :title, :artwork_small, :artwork_large, :gamerscore_current,
			:gamerscore_total, :achievements_current, :achievements_total, :progress, :lastplayed

		def self.fetch(gamertag, id)

		end

		def self.from_hash(gobj, gamertag)
			game = XboxLeaders::Game.new
			game.gamertag = gamertag
			game.id = gobj['id']
			game.hid = gobj['hid']
			game.isapp = gobj['isapp']
			game.title = gobj['title']
			game.artwork_small = gobj['artwork']['small']
			game.artwork_large = gobj['artwork']['large']
			game.gamerscore_current = gobj['gamerscore']['current']
			game.gamerscore_total = gobj['gamerscore']['total']
			game.achievements_current = gobj['achievements']['current']
			game.achievements_total = gobj['achievements']['total']
			game.progress = gobj['progress']

			# TODO: Determine if this is the correct timezone
			game.lastplayed = Time.at(gobj['lastplayed']).utc.to_datetime

			return game
		end

	end

end