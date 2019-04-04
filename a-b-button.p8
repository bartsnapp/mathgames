pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
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
	 if abin[i][j] == 0 then else
	    pset(j+x-1,i+y-1,c*abin[i][j])
	 end
      end
   end	
end

function bbtn(x,y,c)
   for i=1,5 do
      for j=1,7 do
	 if bbin[i][j] == 0 then else
	    pset(j+x-1,i+y-1,c*bbin[i][j])
	 end
      end	
   end
end

function _draw()
   rectfill(0,0,127,127,3)
   abtn(50,50,7)
   bbtn(50,60,15)
end
