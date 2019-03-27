pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- chaos game
-- three points
-- todo: 
-- add a menu, allowing 
-- three points, and then
-- between 3 and the number of 
-- colors points. then allow 
-- user to place the points 
-- with the same controls
-- also sound effects!


function _init()
	state="menu"
	select=0 -- menu item selected
	firstcolor=0
	xfirst=63
	yfirst=63
	x=63
	y=63
	t={} -- change name to midpts
end
-->8
-- draw function

-- draws initial crosshairs
-- only runs when t is empty
function crosshairs(x,y)
	if #t==0 then 
		line(x+3,y,x+5,y,7)	
		line(x-3,y,x-5,y,7)
		line(x,y+3,x,y+5,7)
		line(x,y-3,x,y-5,7)
	end
end

-- adds points of the form 
-- (x,y,color) to t
function addpoint(t)
	for p in all(t) do
		circfill(p[1],p[2],.5,p[3])
	end
end

-- main draw
function _draw()
	cls()
	circfill(63,1,1,8)
	circfill(1,126,1,1)
	circfill(126,126,1,3) 
	crosshairs(x,y)
	addpoint(t)
end
-->8
-- update function

function _update()
	if #t==0 then
		if btn(0) then x=max(x-1,5) end
		if btn(1) then x=min(x+1,122) end
		if btn(2) then y=max(y-1,5) end
		if btn(3) then y=min(y+1,122) end
		if btnp(4) then
			sfx(0) 
			add(t,{x,y,7}) 
		end
	elseif btnp(4) then
		sfx(0)
		pointselector=flr(rnd(3))
		if pointselector==0 then
			x=(63+x)/2
			y=(1+y)/2
			add(t,{x,y,8})
		elseif pointselector==1 then
			x=(1+x)/2
			y=(126+y)/2
			add(t,{x,y,1})
		elseif pointselector==2 then
			x=(126+x)/2
			y=(126+y)/2
			add(t,{x,y,3})
		end
	elseif btnp(5) then
		for i=1,20 do
			sfx(0)
			pointselector=flr(rnd(3))
			if pointselector==0 then
	       x=(63+x)/2
	       y=(1+y)/2
	       add(t,{x,y,8})
			elseif pointselector==1 then
	       x=(1+x)/2
	       y=(126+y)/2
	       add(t,{x,y,1})
			elseif pointselector==2 then
	       x=(126+x)/2
	       y=(126+y)/2
	       add(t,{x,y,3})
			end
		end
	end
end
__sfx__
000100001c07029070320703007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
