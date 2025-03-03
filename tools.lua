--tools
function collision(a,b)
    local a_left = a.x
    local a_top = a.y
    local a_right = a.x+a.w-1
    local a_botton = a.y+a.h-1

    local b_left = b.x
    local b_top = b.y
    local b_right = b.x+b.w-1
    local b_botton = b.y+b.h-1
    
    if a_top > b_botton then return false end
    if b_top > a_botton then return false end
    if a_left > b_right then return false end
    if b_left > a_right then return false end
    return true
end

function map_collision(map_x,map_y)
    cell = mget(map_x,map_y)
    if fget(cell,0) then
        return true
    end
    return false    
end

function direction_vector (ox,oy,tx,ty)  
    local dirx = 0
    local diry = 0

    local lenx = tx - ox
    local leny = ty - oy
    local len = sqrt((lenx ^2)+(leny ^2))

    dirx = lenx/len
    diry = leny/len
    return {dirx, diry}
end

function spr_r(s,x,y,a,w,h)
    --https://www.lexaloffle.com/bbs/?tid=3593
    sw=(w or 1)*8
    sh=(h or 1)*8
    sx=(s%8)*8
    sy=flr(s/8)*8
    x0=flr(0.5*sw)
    y0=flr(0.5*sh)
    a=a/360
    sa=sin(a)
    ca=cos(a)
    for ix=0,sw-1 do
     for iy=0,sh-1 do
      dx=ix-x0
      dy=iy-y0
      xx=flr(dx*ca-dy*sa+x0)
      yy=flr(dx*sa+dy*ca+y0)
      if (xx>=0 and xx<sw and yy>=0 and yy<=sh) then
       pset(x+ix,y+iy,sget(sx+xx,sy+yy))
      end
     end
    end
   end

function random_map_gen()
    for x=0,15 do
        for y=0,15 do
            mset(x,y,17)
        end
    end
    
    for x=0,15 do
        for y=0,15 do
            if ((x==8 and y==8)or(x==8 and y==9)or(x==9 and y==9)or(x==9 and y==8)) then
                mset(x,y,17)
            elseif ((x==1 and y==1)or(x==1 and y==0)or(x==0 and y==0)or(x==0 and y==1)) then
                mset(x,y,17)
            elseif rnd()<0.75 then
                mset(x,y,16)
            end
        end
    end
end

function get_neighbor(map_x,map_y)
    local output = {}
    for x=-1,1 do
        for y=-1,1 do
            if not (x==0 and y==0) then
                add(output,{map_x+x,map_y+y})
            end
        end
    end
    return output
end

function is_wall(map_x,map_y)
    local output = false
    local sprite = mget(map_x,map_y)
    if sprite == 16 then
        return true
    else
        return false
    end
end

function ca_map_gen()
    random_map_gen()
    local loops = 1 
    local walls = 0

    for loops=1,loops do
        for x=0,15 do
            for y=0,15 do
                walls = 0
                neighbors = get_neighbor(x,y)
                for neighbor in all(neighbors) do
                    if is_wall(neighbor[1],neighbor[2]) then
                        walls += 1
                    end
                end
                if walls<4 then
                    mset(x,y,17)
                elseif walls>5 then
                    mset(x,y,16)
                end
            end
        end

    end




end
