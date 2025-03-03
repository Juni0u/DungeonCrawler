--movement_interface table
Movement_interface = {
    square_visible = true, 
    square_timer = 15,
    square_count = 0,

    update = function (self)
        self:update_square_visibility()
    end,

    reset_square_visibility = function (self)
        self.square_count=0
        self.square_visible=false
    end,

    update_square_visibility = function (self)
        self.square_count += 1
        if self.square_count > self.square_timer then
            self.square_count=0
            if self.square_visible==true then
                self.square_visible=false
            else
                self.square_visible=true
            end
        end
        
    end,

    draw_a_square = function (self,ox,oy,color)
        --up-left
        pset(ox,oy,color)
        pset(ox+1,oy,color)
        pset(ox+2,oy,color)
        pset(ox,oy+1,color)
        pset(ox,oy+2,color)
        --up-right
        pset(ox+7,oy,color)
        pset(ox+6,oy,color)
        pset(ox+5,oy,color)
        pset(ox+7,oy+1,color)
        pset(ox+7,oy+2,color)
        -- --down-left
        pset(ox,oy+7,color)
        pset(ox+1,oy+7,color)
        pset(ox+2,oy+7,color)
        pset(ox,oy+6,color)
        pset(ox,oy+5,color)
        --down-right
        pset(ox+7,oy+7,color)
        pset(ox+6,oy+7,color)
        pset(ox+5,oy+7,color)
        pset(ox+7,oy+6,color)
        pset(ox+7,oy+5,color)        
    end,

    draw_mov_squares = function (self)
        local ox = Player.x
        local oy = Player.y
        local color = 0

        if self.square_visible then
            color = 7
        end

        --up
        self:draw_a_square(ox,oy-8,color)
        --down
        self:draw_a_square(ox,oy+8,color)
        --right
        self:draw_a_square(ox+8,oy,color)
        --left
        self:draw_a_square(ox-8,oy,color)
        
    end,

    draw_all_squares = function (self)
        local color = 5
        for i=0,127,8 do
            for j=0,127,8 do
                pset(i,j,color)   --top-left
                pset(i+7,j,color) --top-right
                pset(i,j+7,color)   --down-left
                pset(i+7,j+7,color) --down-right
            end
        end        
    end







}