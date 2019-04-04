pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- chaos game
-- bart snapp
-- also sound effects!


function _init()
   state="menu"
   select=0 -- menu item selected
   r={.5,.5,.5,.45,.4,.35,.35,.25,.25,.2,.2,.2,.15,.15} -- r
   s={1,1,1,1.22,1.5,1.857,1.857,3,3,4,4,4,5.67,5.67} -- scale factor
   -- the scale factor is found by taking:
   -- 1/(sum(r^n,(n,1,infinity)))
   -- (1-r)/r
end

-- adds a btn and b btn glyphs
-- button sprites borrowed from
-- https://www.lexaloffle.com/bbs/?tid=30054
-- post by felice (https://www.lexaloffle.com/bbs/?uid=12874)
abin={{0,1,1,1,1,1,0},
 	{1,1,1,0,1,1,1},
 	{1,1,0,0,0,1,1},
 	{1,1,0,1,0,1,1},
 	{0,1,1,1,1,1,0}}

bbin={{0,1,1,1,1,1,0},
 	{1,1,0,0,1,1,1},
 	{1,1,0,1,0,1,1},
 	{1,1,0,0,0,1,1},
 	{0,1,1,1,1,1,0}}
 	
function abtn(x,y,c)
	for i=1,5 do
		for j=1,7 do
		   pset(j+x-1,i+y-1,c*abin[i][j])
		end
	end	
end

function bbtn(x,y,c)
	for i=1,5 do
		for j=1,7 do
		pset(j+x-1,i+y-1,c*bbin[i][j])
		end
	end	
end


-- adds return to menu
menuitem(1, "return to menu", function() state="menu" end)

-- outline print
-- borrowed from https://github.com/clowerweb/lib-pico8
function print_ol(s,_x,_y,c1,c2)
  for x=-1,1 do
    for y=-1,1 do
      print(s,_x+x,_y+y,c1)
    end
  end
  print(s,_x,_y,c2)
end

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
-- update function

function update_menu()
   startpts={}
   midpts={}
   x=63
   y=63
   color=1
   startdone=false
   if (btnp(5) and select==0) 
   then 
      state="three"
   end
   if (btnp(5) and select==1) 
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
   x=(startpts[pointselector][1]+xx)*r[#startpts]
   y=(startpts[pointselector][2]+yy)*r[#startpts]
   add(midpts,{x,y,startpts[pointselector][3]})
end


function update_three()
   if #midpts==0 then
      if btn(0) then x=max(x-1,5) end
      if btn(1) then x=min(x+1,122) end
      if btn(2) then y=max(y-1,5) end
      if btn(3) then y=min(y+1,122) end
      if btnp(5) then
	 sfx(0) 
	 add(midpts,{x,y,7})
      end
   elseif btnp(5) then
      sfx(0)
      drawmidpts(x,y,startpoints)
   elseif btnp(4) then
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
      if btnp(5) then
	 sfx(0) 
	 add(startpts,{x,y,color})
	 color+=1
      end
      if btnp(4) and # startpts>2 then
	 sfx(1)
	 startdone=true
      end
   elseif #midpts==0 then
      if btn(0) then x=max(x-1,5) end
      if btn(1) then x=min(x+1,122) end
      if btn(2) then y=max(y-1,5) end
      if btn(3) then y=min(y+1,122) end
      if btnp(5) then
	 sfx(0) 
	 add(midpts,{x,y,7}) 
      end
   elseif btnp(5) then
      sfx(0)
      drawmidpts(x,y,startpoints)
   elseif btnp(4) then
      for i=1,100 do
	 sfx(0)
	 drawmidpts(x,y,startpoints)
      end
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
      circfill(s[#startpts]*p[1],s[#startpts]*p[2],.5,p[3])
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
   print_ol("the chaos game",10,9,9,1)
   for i=1,#options do
      print(options[i],10,33+10*(i-1),6)
   end
   print_ol(options[select+1],10,33+10*(select),12,1)
   print("select game and press",10,120,6)
   abtn(97,120,6)
end

function draw_chaos()
   if state=="three" then startpts={{63,1,8},{1,126,12},{126,126,3}} end
   cls()
   crosshairs(x,y)
   addstartpoint(startpts)
   addpoint(midpts)
   -- if #midpts>1 then 
   --    line(midpts[#midpts-1][1],midpts[#midpts-1][2],x,y,6)
   -- end
end
__sfx__
000100001c07029070320703007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000002405021050160501105008000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
