function sleep(n)
	local t0 = os.clock()
	local t1
	repeat 
		t1 = os.clock()
	until(t1-t0 >= n )

end
function wheels_move(drv, n)
	for i=0,n,1 do
		drv:wheelsMove(-127)
	end
end

function role_move_left_dist(drv, n)
	drv:keyDown("left")
	if(n > 10)
	then
		sleep(n/175)
	end
	drv:keyUp("left")
end
function role_move_right_dist(drv, n)
	drv:keyDown("right")
	if(n > 10)
	then
		sleep(n/175)
	end
	drv:keyUp("right")
end
function role_move_up_dist(drv, n)
	drv:keyDown("up")
	if(n > 10)
	then
		sleep(n/175)
	end
	drv:keyUp("up")
end
function role_move_down_dist(drv, n)
	drv:keyDown("down")
	if(n > 10)
	then
		sleep(n/175)
	end
	drv:keyUp("down")
end


function find_down_gate(drv, cap, xplus,yplus, x, y, w, h)
	print("find down gate")
	local ret
	ret = cap:findColorByTvBySize(x, y, w, h, 0x60ffff, 0x59fefe, 60, 25, 20,10)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTvBySize(x, y, w, h, 0x60ffff, 0x59fefe, 10, 10, 60, 5)
	end
	if(ret.ret == 1)
	then
		 --门位置补偿plus像素
		ret.x = ret.x + xplus
		ret.y = ret.y + yplus
	end
	dumpTable(ret)
	return ret
end

win = WinIntf:new()
cap = CapIntf:new()
drv = DrvIntf:new()
utils = UtilsIntf:new()
cap:setShow(true)

local ret = drv:openDevice(0x5188, 0x1801)
--sleep(5)
--role_move_right_dist(drv,100)
--is_close = drv:closeDevice();
--print(is_close)
hwind = win:findWindow("", "地下城与勇士")
--hwind = win:findWindow("", "截图工具")
--hwind = win:findWindow("", "照片")

print(hwind)
cap:setHwnd(hwind)

--ret = find_monster(cap)

--confirm_finish(cap, "D:\\work\\GamePeripheries1\\tmp\\5_tag_12.png")

--ret = cap:pickColorByPosi(752,58)
--dumpTable(ret)
--find_title(drv, cap)
--find_monster(cap)
--ret1 = cap:pickColorByPosi(750,56)
--dumpTable(ret1)
--ret = find_down_gate(drv, cap, 0,150, 300, 300, 500, 300)
--ret = cap:findPicByTv( "D:\\work\\GamePeripheries1\\tmp\\6_tag_1.jpg", 0.8)
--umpTable(ret)0x45ffc8
--ret = cap:findColorByTv( 0xa3ffff, 0xa2fe90, 45, 15, 25, 5)
--ret = cap:findColorByTv(0x00ffff, 0x00fefe, 28, 28, 0,9)
--ret = find_gate(drv, cap, 0,50, 600, 0, 200, 600)
--0x784184
--ret = cap:findColorByTv(0x794f8f, 0x773580, 20, 20, 60 ,15)
--0x90ffff, 0x90f0f0
--ret = cap:findColorByTv(0x1effff, 0x1ef0f0, 20, 20, 60 ,15)
--ret = cap:pickColorByPosi(766,92)
--dumpTable(ret)
--ret = cap:findPicByTv("D:\\work\\GamePeripheries1\\tmp\\5_right_1.png", 0.3)
ret = cap:findPicByTvBySize(180, 60, 470, 160,"D:\\work\\GamePeripheries1\\tmp\\comm_tag_1.jpg", 0.8)
--print("find gate")
dumpTable(ret)
--ret = cap:findPicByTv("D:\\work\\GamePeripheries1\\tmp\\5_up_1.png", 0.5)
--point = cap:findColor(0xb4ffff, 0x9c619f)
--print(point)
--point = cap:findPicByTvBySize(650,40 , 125 ,60, "D:\\work\\GamePeripheries1\\tmp\\5_tag_11.png", 0.9)
--point = cap:findPicByTv("D:\\work\\GamePeripheries1\\tmp\\5_tag_11.png", 0.8)
--dumpTable(point)
--sleep(5)
--role_move_right(drv, 0.5)