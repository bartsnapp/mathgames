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
	choices={}
	permutations ={
	{1,2,3},
	{1,3,2},
	{2,1,3},
	{2,3,1},
	{3,1,2},
	{3,2,1}
	}
end
-->8
-- draw

-- two digit multiplication
x = flr(rnd(100))
y = flr(rnd(100))
z = x*y
function ques_mult(x,y)
	print(x,40,63)
	print("x",50,63)
	print(y,56,63)
	print("=",65,63)
end

function choice_builder(z)
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

choice_order
=permutations[ceil(rnd(6))]

function answers(choices,choice_order)
	print(choices[choice_order[1]],10,100)
	print(choices[choice_order[2]],10,110)
	print(choices[choice_order[3]],10,120)
end

function _draw()
   cls()
   print("every answer below is wrong",10,10)
   print("which answer is closest?",10,20)
   ques_mult(x,y)
   answers(choices,choice_order)
end




-->8
-- update

-- two digit multiplication
function _update()


end
