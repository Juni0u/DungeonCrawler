--player table
Player = {
    x=0,
    y=0,
    w=8,
    h=8,
    sprite=1,
    start_sprite = 1,
    end_sprite = 2,
    sprite_timing = 0.05,
    step=8,
    facing_vector={0,0},
    hp=3,
    invul=false,
    invul_timing=0,
    
    update = function(self)
        self:update_sprite()
        self.x,self.y = self:move()
        self:attack()
        Lance:update()
        self:invulnerability()
     
        if self.hp>=14 then
        self.hp=14
        end
        
    end,
    
    draw = function(self)
            spr(self.sprite,self.x,self.y)
            Lance:draw()
            end,
            
    invulnerability = function(self)
        local max_timing = 15
        if self.invul then
                self.invul_timing += 1
                if self.invul_timing == max_timing then
                        self.invul = false
                        self.invul_timing = 0
                end
        end
    end,

    attack = function (self)
        if (btnp(4)) and Lance.active==false then
                Lance.active = true
        end
    end,
            
    move = function(self)
        local new_x = 0
        local new_y = 0
        local dx = 0
        local dy = 0
        
        if(btnp(0)) then
                dx -= self.step
        elseif(btnp(1)) then 
                dx += self.step		
        elseif(btnp(2)) then
                dy -= self.step	
        elseif(btnp(3)) then
                dy += self.step
        end	

        new_x = self.x + dx
        new_y = self.y + dy

        if map_collision(new_x/8,new_y/8) then
                new_x = self.x
                new_y = self.y
        end

        if dx != 0 or dy != 0 then
                self.facing_vector = direction_vector(self.x,self.y,self.x+dx,self.y+dy)
                Movement_interface:reset_square_visibility()
                Lance.active = true
                E1:update_action() --deve ter um jeito melhor de fazer isso. como faz quando tiver varios inimigos?
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
        
        
        return new_x,new_y
    end,
    
    update_sprite = function(self)
        self.sprite += self.sprite_timing
        if self.sprite >= self.end_sprite+1 then 
                self.sprite=self.start_sprite
        end
        end,

--     update_sprite = function(self,dx,dy)
--             local sprit=1
--             if dx>0 and dy>0 then
--                 --direita baixo
--                 sprit=6
--             elseif dx>0 and dy<0 then
--                 --direita cima
--              sprit=7
--             elseif dx<0 and dy>0 then
--                 --esquerda baixo
--              sprit=9
--             elseif dx<0 and dy<0 then
--              --esquerda cima
--              sprit=8
--             elseif dx>0 and dy==0 then
--                 --direita
--              sprit=2
--             elseif dx<0 and dy==0 then
--                 --esquerda
--              sprit=3
--             elseif dx==0 and dy>0 then
--                 --baixo
--              sprit=5
--             elseif dx==0 and dy<0 then
--                 --cima
--              sprit=4
--             end
--             if self.invul then
--              sprit+=10
--             end
--             return sprit    
--     end,
            
            reseted = function(self)
            self.x=64
            self.y=120
            self.w=8
            self.h=8
            self.sprite=1
            self.speed=2
            self.hp=3
            self.invul=false
            self.invul_timing=0
            end
    
    }