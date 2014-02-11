require 'htmlentities'

module XboxLeaders

	class Achievement

		attr_accessor :gamertag, :game, :game_id, :id, :title, :artwork_locked, :artwork_unlocked, :description, :gamerscore,
			:secret, :unlocked, :unlockdate, :unlockedoffline

		def self.from_hash(gamertag, game, game_id, achievement_hash)

			html_decoder = HTMLEntities.new

			achievement = XboxLeaders::Achievement.new
			achievement.gamertag = gamertag
			achievement.game = game
			achievement.game_id = game_id
			achievement.id = achievement_hash['id']
			achievement.title = achievement_hash['title']
			achievement.artwork_locked = achievement_hash['artwork']['locked']
			achievement.artwork_unlocked = achievement_hash['artwork']['unlocked']
			achievement.description = html_decoder.decode(achievement_hash['description'])
			achievement.gamerscore = achievement_hash['gamerscore']
			achievement.secret = achievement_hash['secret']
			achievement.unlocked = achievement_hash['unlocked']
			achievement.unlockdate = achievement_hash['unlockdate']
			achievement.unlockedoffline = achievement_hash['unlockedoffline']

			return achievement
		end

	end

end