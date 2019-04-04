pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- 10% game
-- bart snapp

-- identify a solution 
-- that is correct for a 
-- problem within 10%

-- multiple answers by either 1.05 or .95 (correct)
-- then by 1.15 or .85
-- then by 1.25 or .75
-- take integers as needed.


-- 6th grade math
-- 7th grade math
-- 8th grade math
-- algebra
-- geometry
-- 3d geometry
-- calculus


function _init()
   state="menu"
   select=0 -- menu item selected
   choices={}
   permutations={
      {1,2,3},
      {1,3,2},
      {2,1,3},
      {2,3,1},
      {3,1,2},
      {3,2,1}
   }
   choice_order=ceil(rnd(6))
   x = flr(rnd(90))+10
   y = flr(rnd(90))+10
   z = x*y
   choice_builder(choices,z) -- builds first answer list
   pos=0;
end

-- adds a btn and b btn glyphs
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
   elseif state=="two_digit_mult" then
      update_two_digit_mult()
   elseif state=="integrate" then
      update_integrate()
   end
end

function _draw()
   if state=="menu" then
      draw_menu()
   elseif state=="two_digit_mult" or state=="integrate" then
      draw_question()
   end
end

-->8
-- draw
function draw_menu()
   options={
      "two digit multiplication",
      "integrals"
   }
   cls()
   rect(0,0,127,127,6)
   rect(0,0,127,20,6)
   print_ol("close!",10,9,9,1)
   for i=1,#options do
      print(options[i],10,33+10*(i-1),6)
   end
   print_ol(options[select+1],10,33+10*(select),12,1)
   print("select game and press",10,120,6)
   abtn(97,120,6)
end
-- two digit multiplication
function question()--x,y)
	print(x,40,63)
	print("x",50,63)
	print(y,56,63)
	print("=",65,63)
end

function choice_builder()--choices,z)
   if flr(rnd(2))==1 then 
      choices[1]=ceil(.95*z)
   else
      choices[1]=flr(1.05*z)
   end
   if flr(rnd(2))==1 then 
      choices[2]=ceil(.85*z)
   else
      choices[2]=flr(1.15*z)
   end
   if flr(rnd(2))==1 then 
      choices[3]=ceil(.75*z)
   else
      choices[3]=flr(1.25*z)
   end
end

function answers(p)--permutations,choices,choice_order)
   print(choices[permutations[choice_order][1]],10,100,7)
   print(choices[permutations[choice_order][2]],10,110,7)
   print(choices[permutations[choice_order][3]],10,120,7)
   rectfill(0,99+10*p,127,105+10*p,5)
   print(choices[permutations[choice_order][1+p]],10,100+10*p,0)
end

function draw_question()
   cls()
   print("every answer below is wrong",10,10,7)
   print("which answer is closest?",10,20,7)
   question()--x,y)
   answers(pos)--permutations,choices,choice_order)
end




-->8
-- update

function update_menu()
   startpts={}
   midpts={}
   x=63
   y=63
   color=1
   startdone=false
   if (btnp(5) and select==0) 
   then 
      state="two_digit_mult"
   end
   if (btnp(5) and select==1) 
   then 
      state="integrate"
   end
   if btnp(3) then 
      select=(select+1)%(#options)
   elseif btnp(2) then 
      select=(select-1)%(#options)
   end
end




-- two digit multiplication
function update_two_digit_mult()
   if btnp(1) or btnp(3) then
      pos+=1
   end
   if btnp(0) or btnp(2) then
      pos-=1
   end
   pos%=3
   if btnp(4) or btnp(5) then
      if 1==permutations[choice_order][pos+1] then
	 sfx(0)
      x = flr(rnd(90))+10
      y = flr(rnd(90))+10
      z = x*y
      choice_order=ceil(rnd(6))
      choice_builder(choices,z)
   	end
   end
end
__gfx__
56500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
75700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
65000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
60700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
75700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000350502c050250501e05016050100500b050080500505004050030500205001050010500105001050010500105001050010500205006050080500b0500e05012050160501b0502005023050320503b050
