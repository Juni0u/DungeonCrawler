--enemy table
function make_enemy(x,y,sprite)
	enemy = {
		x=x,
		y=y,
		h=8,
		w=8,
		sprite=sprite,
		start_sprite = 36,
		end_sprite = 37,
		sprite_timing=0.05,
		step=8,
		del_flag=false,
		heart_giver=false,

		update = function(self)
			self:update_sprite()
		end,

		update_action = function(self)
			self.x,self.y = self:move(self:random_move())
		end,

		draw = function(self)
			spr(self.sprite,self.x,self.y)
		end,
		
		random_move = function ()
			local directions = {"none","t","d","l","r"}
			return rnd(directions)
		end,

		move = function(self,move_direction)
			local new_x = 0
			local new_y = 0
			local dx = 0
			local dy = 0
	
		if(move_direction=="l") then
                dx -= self.step
        elseif(move_direction=="r") then 
                dx += self.step		
        elseif(move_direction=="d") then
                dy -= self.step	
        elseif(move_direction=="t") then
                dy += self.step
        end	

        new_x = self.x + dx
        new_y = self.y + dy

        if map_collision(new_x/8,new_y/8) then
			new_x = self.x
			new_y = self.y
		end

		if new_x<0 then 
			new_x=0
		elseif new_x>128-8 then
				new_x=128-8
		end
		if new_y<0 then
				new_y=0
		elseif new_y>128-8 then
				new_y=128-8
		end
 		
 		return new_x, new_y
		end,

		update_sprite = function(self)
 	  self.sprite += self.sprite_timing
 			if self.sprite >= self.end_sprite+1 then 
 				self.sprite =self.start_sprite
 			end

	end

	}

return enemy
end