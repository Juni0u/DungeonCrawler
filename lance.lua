--lance table
Lance = {
    x=0,
    y=0,
    active=false,
    sprite=27,
    w=8,
    h=4,
    duration=15,
    cooldown=30,
    counter=0,

    draw = function (self)
        if self.active then
            spr(self.sprite,self.x,self.y)
        end
    end,

    update = function (self)
        self:update_sprite()
        if self.active then
            self.counter += 1
            if self.counter > self.duration then
                self.active = false
                self.counter = 0
            end            
        end
        
    end,

    update_sprite = function (self)
        if Player.facing_vector[1]==1 then
            self.sprite=27
            self.x = Player.x + 8
            self.y = Player.y + 2
        elseif Player.facing_vector[1]==-1 then
            self.sprite=28
            self.x = Player.x - 8
            self.y = Player.y + 2
        elseif Player.facing_vector[2]==1 then
            self.sprite=29
            self.x = Player.x + 2
            self.y = Player.y + 9
        elseif Player.facing_vector[2]==-1 then
            self.sprite=30
            self.x = Player.x + 2
            self.y = Player.y - 9
        elseif Player.facing_vector[1]>0 then
            if Player.facing_vector[2]>0 then
                self.sprite=46
                self.x=Player.x + 8
                self.y=Player.y + 8
            else
                self.sprite=43
                self.x=Player.x + 8
                self.y=Player.y - 8
            end
        elseif Player.facing_vector[1]<0 then
            if Player.facing_vector[2]>0 then
                self.sprite=45
                self.x=Player.x - 8
                self.y=Player.y + 8
            else
                self.sprite=44
                self.x=Player.x - 8
                self.y=Player.y - 8
            end
        end
    end


}