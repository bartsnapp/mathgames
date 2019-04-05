pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- vector mage
-- bart snapp

-- vectors drawn by controler
-- spells for magic missle
-- draw vector from center of dungon floor.

-- use 16x16 characters


-- powerful partner, bad aim
-- cast <4,3>

-- then you cast so that the 
-- sum hits enemy

-- block with an orthogonal 
-- vec

-- maybe can apply scalar

-- solve eqn to unlock doors


-- cross product to flip back
-- aether component... (more powerful sorcers)



-- dot product?
-- orthogonal projection? 


-->8
-- main update and draw

function _update()
	update_cast()
end

function _draw()
	draw_cast()
end
-->8
-- updates

x=63 -- needs to be reset
y=63 -- when entering cast

-- the state will be cast
-- the vector drawer will
-- spell


function update_cast()
	if btn(0) then x=max(x-8,7) end
	if btn(1) then x=min(x+8,119) end
	if btn(2) then y=max(y-8,7) end
	if btn(3) then y=min(y+8,119) end
	if btnp(5) then
		function cast(x,y,a,b,t)
		-- draw a line, the camera will shift
		-- thus showing the result of your spell
		 
		end
	end		
end
-->8
-- draws

-- vector grid
function vector_grid()
	for i=0,14 do 
		line(7+8*i,7,7+8*i,119,6)
	end
	for i=0,14 do 
		line(7,7+8*i,119,7+8*i,6)
	end
	line(7,63,119,63,7)
	line(63,7,63,119,7)
end

function vectormage()
	circfill(15,63,8,12)
end

function baddie()
	circfill(71,15,8,11)
end

function spell(x,y)
	line(63,63,x,y,8)
	-- arrowhead
	local l = 3
	local d = sqrt(3)*sqrt(l^2*y^2*(x^2+y^2))
end


function draw_cast()
	cls()
	vector_grid()
	vectormage()
	baddie()
	spell(x,y)
end
