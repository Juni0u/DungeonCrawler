function _init()
    E1 = make_enemy(0,0,36)
    ca_map_gen()
end

function _update()
    music(1)

    Player:update()
    E1:update()
    if btnp(4) then
        ca_map_gen()
    end
    --Movement_interface:update()
end

function _draw()
    cls()
    map()
    --World:draw_all_squares()
    --Movement_interface:draw_mov_squares()
    Player:draw()
    E1:draw()


    -- --drawin director vector

    -- print(Player.facing_vector[1])
    -- print(Player.facing_vector[2])
    --line(Player.x+3,Player.y+3,(Player.facing_vector[1]*10+Player.x)+3,(Player.facing_vector[2]*10+Player.y)+3,7)
    
end