pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
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
		pset(j+x,i+y,c*abin[i][j])
		end
	end	
end

function bbtn(x,y,c)
	for i=1,5 do
		for j=1,7 do
		pset(j+x,i+y,c*bbin[i][j])
		end
	end	
end




function _draw()
 cls()
 abtn(63,63,7)
 bbtn(67,67,15)
end
