pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- find the planets
-- bart snapp

function _init()
	starlist={}
	n=1
end

function star_maker(n)
	for i=1,n do
	add(
		starlist,
		circfill(
			flr(rnd(227)),
			flr(rnd(227)),
			flr(rnd(3))+.5,
			ceil(rnd(15))
		)
	)
	end
end


star_maker(60)

function _draw()
	rectfill(0,0,227,227,1)
	starlist[4]
--	for i=1,60 do 
--		starlist[i] 
--	end
end
