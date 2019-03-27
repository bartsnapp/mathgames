pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- chaos game
-- bart snapp
-- also sound effects!


function _init()
	state="menu"
	select=0 -- menu item selected
	--x=63
	--y=63
	--startpts={}
	--midpts={} -- change name to midpts
	--startdone=false
	--color=1
end

-- adds return to menu
menuitem(1, "return to menu", function() state="menu" end)
-->8
-- main udpate and draw

function _update()
	if state=="menu" then
		update_menu()
	elseif state=="three" then
	        update_three()
	elseif state=="upto" then
		update_upto()
	end
end

function _draw()
	if state=="menu" then
	       draw_menu()
	elseif state=="three" or state=="upto" then
	       draw_chaos()
	end
end
-->8
-- draw function

-- draws initial crosshairs
-- only runs when midpts is empty
function crosshairs(x,y)
	if #midpts==0 then 
		line(x+3,y,x+5,y,7)	
		line(x-3,y,x-5,y,7)
		line(x,y+3,x,y+5,7)
		line(x,y-3,x,y-5,7)
	end
end


-- adds starting points of the form 
-- (x,y,color)
function addstartpoint(startpts)
	for p in all(startpts) do
		circfill(p[1],p[2],1,p[3])
	end
end



-- adds points of the form 
-- (x,y,color) to midpts
function addpoint(midpts)
	for p in all(midpts) do
		circfill(p[1],p[2],.5,p[3])
	end
end

-- main draw

-- menu
function draw_menu()
	options={
		"three points",
		"up to 14 points"
		}
	cls()
	rect(0,0,127,127,6)
	rect(0,0,127,20,6)
	print("the chaos game",10,9,6)
	for i=1,#options do
		print(options[i],10,33+10*(i-1),8)
	end
	print(options[select+1],10,33+10*(select),10)
end


function draw_chaos()
	if state=="three" then startpts={{63,1,8},{1,126,1},{126,126,3}} end
	cls()
	crosshairs(x,y)
	addstartpoint(startpts)
	addpoint(midpts)
end

-->8
-- update function



function update_menu()
startpts={}
midpts={}
x=63
y=63
color=1
startdone=false
if (btnp(4) and select==0) 
	then 
		state="three"
	end
	if (btnp(4) and select==1) 
	then 
		state="upto"
	end
	if btnp(3) then 
		select=(select+1)%(#options)
	elseif btnp(2) then 
		select=(select-1)%(#options)
	end
end


function drawmidpts(xx,yy,startpoints)
	pointselector=ceil(rnd(#startpts))
	x=(startpts[pointselector][1]+xx)/2
	y=(startpts[pointselector][2]+yy)/2
	add(midpts,{x,y,startpts[pointselector][3]})
end


function update_three()
	if #midpts==0 then
		if btn(0) then x=max(x-1,5) end
		if btn(1) then x=min(x+1,122) end
		if btn(2) then y=max(y-1,5) end
		if btn(3) then y=min(y+1,122) end
		if btnp(4) then
			sfx(0) 
			add(midpts,{x,y,7}) 
		end
	elseif btnp(4) then
		sfx(0)
		drawmidpts(x,y,startpoints)
	elseif btnp(5) then
		for i=1,100 do
			sfx(0)
		drawmidpts(x,y,startpoints)
		end
	end
end


function update_upto()
	if (#startpts<14 and startdone==false) then
		if btn(0) then x=max(x-1,5) end
		if btn(1) then x=min(x+1,122) end
		if btn(2) then y=max(y-1,5) end
		if btn(3) then y=min(y+1,122) end
		if btnp(4) then
			sfx(0) 
			add(startpts,{x,y,color})
			color+=1
		end
		if btnp(5) then startdone=true end
	elseif #midpts==0 then
		if btn(0) then x=max(x-1,5) end
		if btn(1) then x=min(x+1,122) end
		if btn(2) then y=max(y-1,5) end
		if btn(3) then y=min(y+1,122) end
		if btnp(4) then
			sfx(0) 
			add(midpts,{x,y,7}) 
		end
	elseif btnp(4) then
		sfx(0)
		drawmidpts(x,y,startpoints)
	elseif btnp(5) then
		for i=1,20 do
			sfx(0)
		drawmidpts(x,y,startpoints)
		end
	end
end




__sfx__
000100001c07029070320703007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
