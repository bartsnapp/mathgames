pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- init and states
-- pi blaster
-- bart snapp

function _init()
	state="blast"
	x=63 y=63
	fire=false
end

function _update()
	if state=="blast" then
	update_blast()
	end
end

function _draw()
	if state=="blast" then
	draw_blast()
	end
end
-->8
-- draw

function blaster(x,y,fire)
	circ(x,y,10,8)
	if fire==true then shots(x,y)
 end
 fire=false
end

function shots(x,y)
for i=1,1 do
circfill(x+rnd(10)-rnd(10),y+rnd(10)-rnd(10),3,rnd(15))
end
end

function draw_blast()
	cls()	
	circ(63,63,63.5,7)
	blaster(x,y,fire)
end
-->8
-- update

function update_blast()
	if btn(0) then x=max(x-1,10) 
	end
	if btn(1) then x=min(x+1,117) 
	end
	if btn(2) then y=max(y-1,10) 
	end
	if btn(3) then y=min(y+1,117) 
	end
	if btnp(4) then fire=true
	end
end
