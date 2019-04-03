pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- this will be a game where
-- people gerrymander.


x=63 y=63
function _update()
	if (btn(0)) then x=x-1 end
	if (btn(1)) then x=x+1 end
	if (btn(2)) then y=y-1 end
	if (btn(3)) then y=y+1 end
end	

function box(x0,y0,x1,y1,c0,c1)
	rectfill(x0,y0,x1,y1,c0)
	rect(x0,y0,x1,y1,c1)
end


-- vedge draws the vertical 
-- edge left of a box
function vedge(x0,y0,x1,y1,c0)
	line(x0,y0,x0,y1,c0)
end	

-- hedge draws the horizontal 
-- edge above a box
function hedge(x0,y0,x1,y1,c0,c1)
	line(x0,y0,x1,y0)
end


function _draw()
	for j=0,17 do
		for i=0,15 do box(i*8,j*8,i*8+8,j*8+8,5,0) 
		end		
	end
	vedge(20,20,40,40,8,9)
	hedge(20,20,40,40,8,8)
	print(4,3,2,14)
	circfill(x,y,7,14)
end
