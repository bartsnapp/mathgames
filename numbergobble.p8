pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- number gobble
-- bart snapp

-- gobble the numbers in order
-- then decreasing order
-- then by 10's
-- then down by 10's
-- then up by 2's
-- then down by 2's 
-- then by 5's.
-- then by 3's

-- use code from collide

-->8
-- main update
-->8
-- updates
-->8
-- draws

-- circled printings	
function cprint(s,x,y,c1,c2) 
	function hoffset(s)
		if #s==1 then return #s 
		else return 1.5*#s 
		end
	end
	circfill(x,y,6,c2)
	print(s,x-hoffset(s),y-2,c1)
end

function _draw()
	cls()
	cprint("4",22,10,9,3)
	line(22,4,22,16,7) -- circle has width 12
end
