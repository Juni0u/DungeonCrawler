--interface table
interface = {
	draw_x=0,
	draw_y=0,

	draw = function(self)
		self.draw_x = 0
		self.draw_y = 0
		self.draw_x, self.draw_y = self:player_hp()
		self:stage_counter()
		self:timer_counter()
	end,

	stage_counter = function(self)
			print("stage "..stage.current,1,11,7	)
	end,

	timer_counter = function(self)
			print("time "..flr(stage.current_time),1,20,7	)
	end,

	player_hp = function(self)
			local draw_pixel = self.draw_x
				for i=1,player.hp do
					spr(48,draw_pixel,1)
					draw_pixel += 9
			end
			
			local draw_x = draw_pixel
			local draw_y = self.draw_y
			return draw_x, draw_y
	end,
	
	reseted_screen = function(self)
			print("game over", 40,44,9)
			print("press 'z' or 'x' to re-start!", 14,54,10)

	end

}