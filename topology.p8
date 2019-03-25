pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- title and menu
-- exploring surfaces
-- bart snapp

function _init()
	state="menu"
	select=0 -- menu item selected
	palt(13,true)
	palt(0,false)
	
end	

function centerllama()
	 facing="left"
	 x=47 y=47
	 xx=79 yy=79-- to allow peaking across the slide
end

-->8
-- llama code


function llama(x,xx,y,yy)
	 if (state=="plane" or
   	 state=="cylinder" or
   	 state=="torus")
	 then
	 llamaorientable(x,xx,y,yy)
	 elseif state=="mobius"
	 then
	 llamamobius(x,xx,y,yy)
	 elseif state=="klein"
	 then
	 llamamobius(x,xx,y,yy)
	 end
end

function llamaorientable(x,xx,y,yy)
	 if ((btn(0) or facing=="left"))
	 then facing="left"
 	      spr(1,x,y,4,4)
	      spr(1,xx-32,yy-32,4,4)
	      spr(1,x,yy-32,4,4)
	      spr(1,xx-32,y,4,4)
	 end
	 if ((btn(1) or facing=="right") and (not btn(0)))
	 then facing="right"
 	      spr(5,x,y,4,4)
	      spr(5,xx-32,yy-32,4,4)
	      spr(5,x,yy-32,4,4)
	      spr(5,xx-32,y,4,4)
 	 end
end


offvflip=32

function llamamobius(x,xx,y,yy)
	 if ((btn(0) or facing=="left"))
	 then facing="left"
	 if x>-2 then
	    spr(1,x,y,4,4)
	    spr(1,x,yy-32,4,4)
	    else
	    spr(1,x%128,128-(y+offvflip),4,4,false,true)
	    spr(1,x%128,128-(yy-32+offvflip),4,4,false,true)
	 end
	 if xx>6 then
	 spr(1,xx-32,yy-32,4,4)
	 spr(1,xx-32,y,4,4)
	    else
	    spr(1,128+(xx-32),128-(yy-32+offvflip),4,4,false,true)
	    spr(1,128+(xx-32),128-(y+offvflip),4,4,false,true)
	 end
	 end
	 if ((btn(1) or facing=="right") and (not btn(0)))
	 then facing="right"
 	 if x>-2 then
	    spr(5,x,y,4,4)
	    spr(5,x,yy-32,4,4)
	    else
	    spr(5,x%128,128-(y+offvflip),4,4,false,true)
	    spr(5,x%128,128-(yy-32+offvflip),4,4,false,true)
	 end
	 if xx>6 then
	 spr(5,xx-32,yy-32,4,4)
	 spr(5,xx-32,y,4,4)
	    else
	    spr(5,128+(xx-32),128-(yy-32+offvflip),4,4,false,true)
	    spr(5,128+(xx-32),128-(y+offvflip),4,4,false,true)
	 end
 	 end
end


function llamarp(x,xx,y,yy)
	 if ((btn(0) or facing=="left"))
	 then facing="left"
	 if x>-2 then
	    spr(1,x,y,4,4)
	    spr(1,x,yy-32,4,4)
	    else
	    spr(1,x%128,128-(y+offvflip),4,4,false,true)
	    spr(1,x%128,128-(yy-32+offvflip),4,4,false,true)
	 end
	 if xx>6 then
	 spr(1,xx-32,yy-32,4,4)
	 spr(1,xx-32,y,4,4)
	    else
	    spr(1,128+(xx-32),128-(yy-32+offvflip),4,4,false,true)
	    spr(1,128+(xx-32),128-(y+offvflip),4,4,false,true)
	 end
	 end
	 if ((btn(1) or facing=="right") and (not btn(0)))
	 then facing="right"
 	 if x>-2 then
	    spr(5,x,y,4,4)
	    spr(5,x,yy-32,4,4)
	    else
	    spr(5,x%128,128-(y+offvflip),4,4,false,true)
	    spr(5,x%128,128-(yy-32+offvflip),4,4,false,true)
	 end
	 if xx>6 then
	 spr(5,xx-32,yy-32,4,4)
	 spr(5,xx-32,y,4,4)
	    else
	    spr(5,128+(xx-32),128-(yy-32+offvflip),4,4,false,true)
	    spr(5,128+(xx-32),128-(y+offvflip),4,4,false,true)
	 end
 	 end
end
-->8
-- draw commands

-- menu
function draw_menu()
	options={
		"finite plane",
		"cylinder",
		"mobius strip",
		"torus",
		"klein bottle",
		"sphere",
		"real projective plane"
		}
	cls()
	rect(0,0,127,127,6)
	rect(0,0,127,20,6)
	print("topology explorer",10,9,6)
	for i=1,#options do
		print(options[i],10,33+10*(i-1),8)
	end
	print(options[select+1],10,33+10*(select),10)
	print(select,20,110)
end

-- tutorials
function draw_surface()
	 cls()
	 map(0,0,0,0,16,8)		
	 map(0,0,0,64,16,8)
	 if state=="plane" then
	 print("finite plane",10,1,0)
	 elseif state=="cylinder" then
	 print("cylinder",10,1,0)
	 elseif state=="mobius" then
	 print("mobius strip",10,1,0)
	 elseif state=="torus" then
	 print("torus",10,1,0)
	 elseif state=="klein" then
	 print("klein bottle",10,1,0)
	 end
	 print("press z to go back to menu",
	 10,122,0)
	 --clip(-1,7,129,114)
	 
	 llama(x,xx,y,yy)
	 print(x,20,90)
	 print(xx,20,100)
	 print(y,90,90)
	 print(yy,90,100)
end




-->8
-- update commands

function update_menu()
 if (btnp(4) and select==0) 
	then 
		state="plane"
	end
	if (btnp(4) and select==1) 
	then 
		state="cylinder"
	end
	if (btnp(4) and select==2) 
	then 
		state="mobius"
	end
	if (btnp(4) and select==3) 
	then 
		state="torus"
	end
	if (btnp(4) and select==4) 
	then 
		state="klein"
	end
	if btnp(3) then 
		select=(select+1)%(#options)
	elseif btnp(2) then 
		select=(select-1)%(#options)
	end
end


function update_plane()
	if btn(0) then 
		x=max(x-1,-2)
		xx=max(xx-1,30)
	end
	if btn(1) then 
		x=min(x+1,98)
		xx=min(xx+1,130)
	end
	if btn(2) then 
		y=max(y-1,-1)
		yy=max(yy-1,31)
	end
	if btn(3) then 
		y=min(y+1,96)
		yy=min(yy+1,128) 
	end	
	if btnp(4) then state="menu" end
end


function update_cylinder()
	if btn(0) then 
		x=(x-1)%128
		xx=(xx-1)%128
	end
	if btn(1) then
	   	x=(x+1)%128 
		xx=(xx+1)%128
	end
	if btn(2) then
		y=max(y-1,-1)
		yy=max(yy-1,31)
	end
	if btn(3) then 
		y=min(y+1,96)
		yy=min(yy+1,128) 
	end	
	if btnp(4) then state="menu" end
end


function update_mobius()
	if btn(0) then 
		x=max(x-1,-128)
		if x==-128 then x=128 end
		xx=max(xx-1,-128)
		if xx==-128 then xx=128 end
	end
	if btn(1) then 
		x=min(x+1,128)
		if x==128 then x=-128 end
		xx=min(xx+1,128)
		if xx==128 then xx=-128 end
	end
	
        if btn(2) then
	   y=max(y-1,-1)
	   yy=max(yy-1,31)
	end
	if btn(3) then 
	   y=min(y+1,96)
	   yy=min(yy+1,128) 
	end	
	if btnp(4) then state="menu" end
end


function update_torus()
	if btn(0) then 
		x=(x-1)%128
		xx=(xx-1)%128
	end
	if btn(1) then
	   	x=(x+1)%128
		xx=(xx+1)%128
	end
	if btn(2) then
	   	y=(y-1)%128
		yy=(yy-1)%128
	end
	if btn(3) then
	   	y=(y+1)%128
		yy=(yy+1)%128
	end	
	if btnp(4) then state="menu" end
end


function update_klein()
	if btn(0) then 
		x=max(x-1,-128)
		if x==-128 then x=128 end
		xx=max(xx-1,-128)
		if xx==-128 then xx=128 end
	end
	if btn(1) then 
		x=min(x+1,128)
		if x==128 then x=-128 end
		xx=min(xx+1,128)
		if xx==128 then xx=-128 end
	end
	
        if btn(2) then
	   	y=(y-1)%128
		yy=(yy-1)%128
	end
	if btn(3) then
	   	y=(y+1)%128
		yy=(yy+1)%128
	end
	if btnp(4) then state="menu" end
end
-->8
-- main udpate and draw

function _update()
	if state=="menu" then
		update_menu()
	elseif state=="plane" then
	        update_plane()
	elseif state=="cylinder" then
		update_cylinder()
	elseif state=="mobius" then
		update_mobius()
	elseif state=="torus" then
		update_torus()
	elseif state=="klein" then
		update_klein()	
	end
end

function _draw()
	if state=="menu" then
	   	centerllama()
		draw_menu()
	elseif (state=="plane" or
	        state=="cylinder" or
		state=="mobius" or
		state=="torus" or
		state=="klein") then
		draw_surface()
	end
end
__gfx__
00000000dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd333333333333333333232333
00000000ddddd0dddddddddddddddddddddddddddddddddddddd0dddddddddddddddddddddddd0dddddddddddddddddddddddddd333333333333333332e8e233
00700700dddd010d000dddddddddddddddddddddddddddd000d010dddddddddddddddddddddd000d000ddddddddddddddddddddd33333333333bb333322e2333
00077000ddddd01010dddddddddddddddddddddddddddddd01010dddddddddddddddddddddddd00000dddddddddddddddddddddd33333333333b33b333222333
00077000ddddd0990dddddddddddddddddddddddddddddddd0990dddddddddddddddddddddddd0770ddddddddddddddddddddddd33333333bb3b3bb3333b33b3
00700700dddd009090dddddddddddddddddddddddddddddd090900dddddddddddddddddddddd007070dddddddddddddddddddddd333333333bbbbb3b3b3b3bb3
00000000ddd00909990dddddddddddddddddddddddddddd09990900dddddddddddddddddddd00707770ddddddddddddddddddddd3333333333bbb3bb3bbbbb33
00000000dd099999990dddddddddddddddddddddddddddd099999990dddddddddddddddddd077777770ddddddddddddddddddddd3333333333bbbbb333bbb333
00000000dd009999990dddddddddddddddddddddddddddd099999900dddddddddddddddddd007777770ddddddddddddddddddddd000000000000000000000000
00000000ddd00000990dddddddddddddddddddddddddddd09900000dddddddddddddddddddd00000770ddddddddddddddddddddd000000000000000000000000
00000000ddddddd0990dddddddddddddddddddddddddddd0990dddddddddddddddddddddddddddd0770ddddddddddddddddddddd000000000000000000000000
00000000ddddddd09990ddddddddddddddddddddddddddd0990dddddddddddddddddddddddddddd07770dddddddddddddddddddd000000000000000000000000
00000000ddddddd09990ddddddddddddddddddddddddddd09990ddddddddddddddddddddddddddd07770dddddddddddddddddddd000000000000000000000000
00000000ddddddd09990ddddddddddddddddddddddddddd09990ddddddddddddddddddddddddddd07770dddddddddddddddddddd000000000000000000000000
00000000ddddddd019990dddddddddddddddddddddddddd019990dddddddddddddddddddddddddd007770ddddddddddddddddddd000000000000000000000000
00000000ddddddd0059900ddddddddddddddddddddddddd0059900ddddddddddddddddddddddddd0007700dddddddddddddddddd000000000000000000000000
00000000dddddddd049990000000000000dddddddddddddd049990000000000000dddddddddddddd007770000000000000dddddd000000000000000000000000
00000000dddddddd0159990101100099510ddddddddddddd0159990101100099510ddddddddddddd0007770000000077700ddddd000000000000000000000000
00000000dddddddd0049990050510199950ddddddddddddd0049990050510199950ddddddddddddd0007770000000077700ddddd000000000000000000000000
00000000dddddddd001599901414145990dddddddddddddd001599901414145990dddddddddddddd000077700000000770dddddd000000000000000000000000
00000000ddddddddd04999999999999990ddddddddddddddd04999999999999990ddddddddddddddd00777777777777770dddddd000000000000000000000000
00000000ddddddddd01599999999999990ddddddddddddddd01599999999999990ddddddddddddddd00077777777777770dddddd000000000000000000000000
00000000ddddddddd0019999a999999990ddddddddddddddd0019999a999999990ddddddddddddddd00077777777777770dddddd000000000000000000000000
00000000ddddddddd000999a9a9a999990ddddddddddddddd000999a9a9a999990ddddddddddddddd00077777777777770dddddd000000000000000000000000
00000000ddddddddd09999a4a4a4a99990ddddddddddddddd09999a4a4a4a99990ddddddddddddddd07777777777777770dddddd000000000000000000000000
00000000ddddddddd09990000000009990ddddddddddddddd09990000000009990ddddddddddddddd07770000000007770dddddd000000000000000000000000
00000000ddddddddd0990dddddddd0090dddddddddddddddd0990dddddddd0090dddddddddddddddd0770dddddddd0070ddddddd000000000000000000000000
00000000ddddddddd0990ddddddddd0990ddddddddddddddd0990ddddddddd0990ddddddddddddddd0770ddddddddd0770dddddd000000000000000000000000
00000000ddddddddd0990ddddddddd0990ddddddddddddddd0990ddddddddd0990ddddddddddddddd0770ddddddddd0770dddddd000000000000000000000000
00000000dddddddd0990ddddddddd09990dddddddddddddd0990ddddddddd09990dddddddddddddddd0770ddddddd07770dddddd000000000000000000000000
00000000dddddddd0900dddddddd00990ddddddddddddddd0900dddddddd00990ddddddddddddddddd0070dddddd00770ddddddd000000000000000000000000
00000000dddddddd000dddddddddd0000ddddddddddddddd000dddddddddd0000dddddddddddddddddd000ddddddd0000ddddddd000000000000000000000000
00000000333333333333333333232333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333333333333332e8e233000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000033333333333bb333322e2333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000033333333333b33b333222333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000033333333bb3b3bb3333b33b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333333bbbbb3b3b3b3bb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003333333333bbb3bb3bbbbb33000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003333333333bbbbb333bbb333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0d0d0d0d0d0d0e0d0d0d0d0d0d0e0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0e0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0f0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0e0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0f0d0d0d0d0d0d0d0d0d0d0e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e0d0d0d0d0d0d0d0f0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0e0d0d0d0d0d0d0d0e0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
