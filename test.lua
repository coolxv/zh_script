-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
function sleep(n)
	local t0 = os.clock()
	local t1
	repeat 
		t1 = os.clock()
	until(t1-t0 >= n )

end
function wheels_move_down(drv, n)
	for i=0,n,1 do
		drv:wheelsMove(-127)
	end
end
function wheels_move_up(drv, n)
	for i=0,n,1 do
		drv:wheelsMove(127)
	end
end
function dump_table(t)
	if(gc_debug)
	then
		dumpTable(t)
	end
end
function gen_random(t)
	math.randomseed(100)
	return math.random(1000)%t
end

function in_table(tlb, val)
    for k,v in ipairs(tlb) do
      if v == val then
          return true
      end
    end
    return false
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

--基于时间,走
function role_move_left_time(drv, n)
	drv:keyDown("left")
	sleep(n)
	drv:keyUp("left")
	print("move left by time", n)
end
function role_move_right_time(drv, n)
	drv:keyDown("right")
	sleep(n)
	drv:keyUp("right")
	print("move right by time", n)
end
function role_move_up_time(drv, n)
	drv:keyDown("up")
	sleep(n)
	drv:keyUp("up")
	print("move up", n)
end
function role_move_down_time(drv, n)
	drv:keyDown("down")
	sleep(n)
	drv:keyUp("down")
	print("move down by time", n)
end
--基于像素,走
function role_move_left_dist(drv, n)
	drv:keyDown("left")
	sleep(n/180)
	drv:keyUp("left")
	print("move left by dist", n/180)
end
function role_move_right_dist(drv, n)
	drv:keyDown("right")
	sleep(n/180)
	drv:keyUp("right")
	print("move right by dist", n/180)
end
function role_move_up_dist(drv, n)
	drv:keyDown("up")
	sleep(n/120)
	drv:keyUp("up")
	print("move up by dist", n/110)
end
function role_move_down_dist(drv, n)
	drv:keyDown("down")
	sleep(n/120)
	drv:keyUp("down")
	print("move down by dist", n/110)
end
--基于像素,跑
function role_quick_move_left_dist(drv, n)
	local v = n/370
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end

	drv:keyPress("left",3)
	drv:keyDown("left")
	sleep(v)
	drv:keyUp("left")
	print("move quick left by dist", v)
end
function role_quick_move_right_dist(drv, n)
	local v = n/370
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end

	drv:keyPress("right",3)
	drv:keyDown("right")
	sleep(v)
	drv:keyUp("right")
	print("move quick right by dist", v)
end
function role_quick_move_up_dist(drv, n)
	local v = n/120
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end
	drv:keyDown("up")
	sleep(v)
	drv:keyUp("up")
	print("move quick up by dist", v)
end
function role_quick_move_down_dist(drv, n)
	local v = n/120
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end
	drv:keyDown("down")
	sleep(v)
	drv:keyUp("down")
	print("move quick down by dist", v)
end

--基于像素
function role_quick_move_left_up_dist(drv, n)
	local v = n/370
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end	
	drv:keyPress("left",1)
	sleep(0.2)
	drv:keyPress("left",1)
	drv:keyDown("left")
	sleep(0.1)
	drv:keyDown("up")
	sleep(v)
	drv:keyUp("up")
	drv:keyUp("left")
	print("move quick left-up by dist", v)
end
function role_quick_move_right_up_dist(drv, n)
	local v = n/370
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end	
	drv:keyPress("right",1)
	sleep(0.2)
	drv:keyPress("right",1)
	drv:keyDown("right")
	sleep(0.1)
	drv:keyDown("up")
	sleep(v)
	drv:keyUp("up")
	drv:keyUp("right")
	print("move quick right-up by dist", v)
end
function role_quick_move_left_down_dist(drv, n)
	local v = n/370
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end	
	drv:keyPress("left",1)
	sleep(0.2)
	drv:keyPress("left",1)
	drv:keyDown("left")
	sleep(0.1)
	drv:keyDown("down")
	sleep(v)
	drv:keyUp("down")
	drv:keyUp("left")
	print("move quick left-down by dist", v)
end
function role_quick_move_right_down_dist(drv, n)
	local v = n/370
	if(v < 0.1)
	then 
		v = 0.1
	elseif(v > 0.1 and v < 0.2)
	then
		v = 0.2 
	end	
	drv:keyPress("right",1)
	sleep(0.2)
	drv:keyPress("right",1)
	drv:keyDown("right")
	sleep(0.1)
	drv:keyDown("down")
	sleep(v)
	drv:keyUp("down")
	drv:keyUp("right")
	print("move quick right-down by dist", v)
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------


--把程序移动到0,0位置
function reset_posi(drv, win, hwind ,adjust)
	--移动界面
	print("rest position", adjust)
	local crect
	local count = 0
	if(adjust == true)
	then
		repeat
			--获取客户端位置
			crect = win:getClientSize(hwind)
			print("before position1:", crect.x, crect.y)
			--dump_table(crect)
			--移动游戏客户端
			drv:moveTo(crect.x + 250, crect.y + 10)
			sleep(0.5)
			drv:leftDown()
			sleep(1)
			drv:moveTo(260, 20)
			sleep(0.5)
			drv:leftUp()
			--重新获取客户端位置
			crect = win:getClientSize(hwind)
			print("after position1:", crect.x, crect.y)
			if(crect.ret == 0)
			then
				sleep(2)
			end
		until(crect.ret > 0 and crect.x == 10 and crect.y == 10)
		
		repeat
			--获取客户端位置
			count = count + 1
			crect = win:getClientSize(hwind)
			print("before position2:", crect.x, crect.y)
			--dump_table(crect)
			--移动游戏客户端
			drv:moveTo(crect.x + 250, crect.y + 10)
			sleep(0.5)
			drv:leftDown()
			sleep(1)
			drv:moveTo(250, 10)
			sleep(0.5)
			drv:leftUp()
			--重新获取客户端位置
			crect = win:getClientSize(hwind)
			print("after position2:", crect.x, crect.y)
			if(crect.ret == 0)
			then
				sleep(2)
			end
		until((crect.ret > 0 and crect.x == 0 and crect.y == 0) or count > 5 )
	else
		--获取客户端位置
		crect = win:getClientSize(hwind)
		print("current position:", crect.x, crect.y)
		--激活
		drv:moveTo(crect.x + 250, crect.y + 10)
		sleep(0.5)
		drv:leftClick(1)
	end

	return crect
end
--鼠标移动到x，y位置
function mouse_move(drv, win, hwind, x, y)
	--获取客户端位置
	local crect = win:getClientSize(hwind)
	--移动移动鼠标
	drv:moveTo(crect.x + x, crect.y + y)
	sleep(0.1)
	print("mouse move to",x , y, crect.x + x, crect.y + y)
	return crect
end
--鼠标移动到200，10位置
function mouse_reset(drv, win, hwind)
	--获取客户端位置
	local crect = win:getClientSize(hwind)
	--移动移动鼠标
	drv:moveTo(crect.x + 250, crect.y + 10)
	sleep(0.1)
	drv:leftClick(2)
	print("mouse rest 250 10")
	return crect
end
--确认ecs菜单
function confirm_menu(drv, win, cap, win_name, pic)
	print("confirm menu esc:")
	local count = 0
	--查找客户端
	local hwind = win:findWindow("", win_name)
	--获取客户端位置
	local crect = win:getClientSize(hwind)
::redo::
	repeat
		count = count + 1
		drv:keyPress("esc", 1);
		sleep(3)
		ret = cap:findPicByTvBySize(180, 90, 470, 390, pic, 0.5)
		print("confirm menu",ret.ret,count)
		dump_table(ret)
	until(ret.ret > 0)
	drv:keyPress("esc", 1);
	sleep(3)
	ret = cap:findPicByTvBySize(180, 90, 470, 390, pic, 0.5)
	if(ret.ret > 0)
	then
		goto redo
	end
	print("confirm menu over")
end
--切换到角色选择页面
function switch_to_role_select(drv, win, cap, win_name, pic)
	print("switch to role select pic")
	local count = 0
	--查找客户端
	local hwind = win:findWindow("", win_name)
	--获取客户端位置
	local crect = win:getClientSize(hwind)
::redo::
	repeat
		count = count + 1
		drv:keyPress("esc", 1);
		sleep(3)
		ret = cap:findPicByTvBySize(180, 90, 470, 390, pic, 0.5)
		print("switch role:",ret.ret,count)
		dump_table(ret)
	until(ret.ret > 0)
	--移动鼠标
	mouse_move(drv, win, ctx.hwind, 385, 460)
	drv:leftClick(3)
	sleep(3)
	ret = cap:findPicByTvBySize(180, 90, 470, 390, pic, 0.5)
	if(ret.ret > 0)
	then
		goto redo
	end
	print("switch role over")
end
--退出程序
function switch_to_game_over(drv, win, cap, win_name, pic)
	print("switch to game over pic")
	local count = 0
	--查找客户端
	local hwind = win:findWindow("", win_name)
	--获取客户端位置
	local crect = win:getClientSize(hwind)
::redo::
	repeat
		count = count + 1
		drv:keyPress("esc", 1);
		sleep(3)
		ret = cap:findPicByTvBySize(180, 90, 470, 390, pic, 0.5)
		print("quit game:",ret.ret,count)
		dump_table(ret)
	until(ret.ret > 0)
	--移动鼠标
	mouse_move(drv, win, ctx.hwind, 385, 460)
	drv:leftClick(3)
	sleep(5)
	hwind = win:findWindow("", win_name)
	if(hwind > 0)
	then
		goto redo
	end
	print("quit game over")
end
--确认ui
function confirm_ui(cap, tag, value, times)
	print("confirm ui:")
	local count = 0
	local ret
	--确认界面
	repeat
		count = count + 1
		ret = cap:findPicByTv(tag, value)
		print(tag,ret.ret,value,times,count)
		if(ret.ret == 0 )
		then
			if(times > 0 and count >= times)
			then
				return 0 
			end
			sleep(2)
		end
	until(ret.ret > 0 )	
	return 1
end
--确认ui，根据大小
function confirm_ui_by_size(x, y ,w, h, cap, tag, value, times)
	print("confirm ui by size:",x,y,w,h)
	local count = 0
	local ret
	--确认界面
	repeat
		count = count + 1
		ret = cap:findPicByTvBySize(x, y, w, h, tag, value)
		print(tag,ret.ret,value,times,count)
		if(ret.ret == 0 )
		then
			if(times > 0 and count >= times)
			then
				return 0 
			end
			sleep(2)
		end
	until(ret.ret > 0 )	
	return 1
end
--确认副本位置
function confirm_posi(cap, tag)
	local ret
	local posi
	ret = cap:findPicByTvBySize(700, 0, 100, 200, tag, 0.6)
	if(ret.ret == 1)
	then
		if(ret.x == 721 and ret.y == 47)
		then
			posi = 1
		elseif(ret.x == 739 and ret.y == 47)
		then
			posi = 2
		elseif(ret.x == 757 and ret.y == 47)
		then
			posi = 3
		elseif(ret.x == 757 and ret.y == 65)
		then
			posi = 4
		elseif(ret.x == 757 and ret.y == 83)
		then
			posi = 5
		elseif(ret.x == 775 and ret.y == 83)
		then
			posi = 6
		elseif(ret.x == 739 and ret.y == 65)
		then
			posi = 8
		elseif(ret.x == 739 and ret.y == 83)
		then
			posi = 9
		else
			posi = 0
		end
	else
		posi = 7
	end
	print("confirm posi",posi)
	dump_table(ret)
	return posi
end

--确认副本是否完成 图1-5用此函数确认
function confirm_finish_by_color(cap, n)
	local ret

	if(n == 1)
	then
		ret = cap:pickColorByPosi(748,56)
	elseif(n == 2)
	then
		ret = cap:pickColorByPosi(766,56)
	elseif(n == 3)
	then
		ret = cap:pickColorByPosi(766,74)
	elseif(n == 4)
	then
		ret = cap:pickColorByPosi(766,92)
	elseif(n == 5)
	then
		ret = cap:pickColorByPosi(784,92)
	else
		--第6-9副图，不在此函数确定，直接返回返回完成
		print("confirm finish c(6-9)", n)
		dump_table(ret)
		--完成
		return 1
	end
	
	if(ret.h < 5)
	then
		--未完成
		print("not confirm finish c", n)
		dump_table(ret)
		return 0
	end
	print("confirm finish c", n)
	dump_table(ret)
	--完成
	return 1
end

--确认完成-废弃
function confirm_finish_by_pic(cap, tag)
	local ret
	ret = cap:findPicByTvBySize(700, 0, 100, 130, tag, 0.6)
	if(ret.ret == 1)
	then
		print("confirm finish p")
		dump_table(ret)
		return 1
	else
		print("not confirm finish p")
		dump_table(ret)
		return 0
	end
end
--确认整个副本完成
function confirm_whole_finish(cap, tag)
	local ret
	ret = cap:findPicByTvBySize(0, 0, 800, 300, tag, 0.8)
	if(ret.ret == 1)
	then
		print("confirm whole finish1")
		dump_table(ret)
		return 1
	else
		print("not confirm whole finish1")
		dump_table(ret)
		return 0
	end
end
--确认整个副本完成2
function confirm_whole_finish2(cap, tag)
	local ret
	ret = cap:findPicByTvBySize(550, 0, 250, 250, tag, 0.8)
	if(ret.ret == 1)
	then
		print("confirm whole finish2")
		dump_table(ret)
		return 1
	else
		print("not confirm whole finish2")
		dump_table(ret)
		return 0
	end
end
--确认整个角色完成
function confirm_role_finish(cap, tag)
	local ret
	ret = cap:findPicByTvBySize(0, 500, 800, 100, tag, 0.985)
	if(ret.ret == 1)
	then
		print("confirm role finish")
		dump_table(ret)
		return 1
	else
		print("not confirm role finish")
		dump_table(ret)
		return 0
	end
end

--确认黄金卡片
function confirm_gold_pic(cap, tag)
	local ret
	ret = cap:findPicByTv(tag, 0.5)
	if(ret.ret == 1)
	then
		print("confirm gold pic")
		dump_table(ret)
		return 1
	else
		print("not confirm gold pic")
		dump_table(ret)
		return 0
	end
end
--找Boss
function find_boss(cap)
	local ret
	ret = cap:findColorByTv( 0xa3ffff, 0xa2fe90, 45, 15, 25, 5)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTv(0x85fffa, 0x85faf0, 20, 15, 50, 5)
	end
	if(ret.ret == 1)
	then
		 --boss位置补偿
		--ret.y = ret.y + 20
		print("find boss", ret.x, ret.y)
	else
		print("not find boss")
	end
	--dump_table(ret)
	return ret
end

--找怪物
function find_monster(cap)
	local ret
	ret = cap:findColorByTv(0x85fffa, 0x85faf0, 39, 33, 650, 15)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTv(0x85fffa, 0x85faf0, 15, 15, 60, 5)
	end
	if(ret.ret == 1)
	then
		 --怪物位置补偿35像素
		--ret.y = ret.y + 10
		print("find monster", ret.x, ret.y)
	else
		print("not find monster")
	end
	--dump_table(ret)
	return ret
end
--找塔
function find_tower(cap)
	local ret
	ret = cap:findColorByTv(0x46ffc8, 0x45f0c0, 60, 25, 20, 10)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTv(0x46ffc8, 0x45f0c0, 15, 15, 60, 5)
	end
	if(ret.ret == 1)
	then
		 --塔位置补偿35像素
		--ret.y = ret.y + 10
		print("find tower", ret.x, ret.y)
	else
		print("not find tower")
	end
	--dump_table(ret)
	return ret
end
--找地上装备
function find_money(drv, cap)
	local ret
	ret = cap:findColorByTvBySize(0, 85, 720, 515, 0x00ffff, 0x00fefe, 28, 28, 20,15)
	if(ret.ret == 1)
	then
		 --门位置补偿plus像素
		ret.y = ret.y + 10
		print("find money", ret.x, ret.y)
	else
		print("not find money")
	end
	--dump_table(ret)
	return ret
end

--找人物
function find_title(drv, cap)

	local ret
	local n = 0
	--第一遍查找1ebeff
	ret = cap:findColorByTv(0x1ec0ff, 0x1eb0f0, 39, 36, 21,10)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTv(0x1ec0ff, 0x1eb0f0, 10, 10, 60, 5)
	end
	--找不到移动查找
	while(ret.ret == 0)
	do
		n = n + 25
		--先向右移动
		role_move_right_dist(drv, n)
		ret = cap:findColorByTv(0x1ec0ff, 0x1eb0f0, 10, 10, 60, 5)
		if(ret.ret == 0)
		then
			n = n + 1
			role_move_left_dist(drv, n)
			ret = cap:findColorByTv(0x1ec0ff, 0x1eb0f0, 10, 10, 60, 5)
			if(ret.ret == 0)
			then
				role_move_up_dist(drv, n)
				ret = cap:findColorByTv(0x1ec0ff, 0x1eb0f0, 10, 10, 60, 5)
				if(ret.ret == 0)
				then
					n = n + 1
					role_move_down_dist(drv, n)
					ret = cap:findColorByTv(0x1ec0ff, 0x1eb0f0, 10, 10, 60, 5)
				end
			end
		end
	end		

	 --人物位置补偿150像素
	ret.y = ret.y + 150
	print("find title", ret.x, ret.y)
	--dump_table(ret)
	return ret
end
--找门 -所有门 --废弃
function find_gate(drv, cap, xplus,yplus, x, y, w, h)
	local ret
	ret = cap:findColorByTvBySize(x, y, w, h, 0x1effff, 0x1ef0f0, 60, 25, 20,10)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTvBySize(x, y, w, h, 0x1effff, 0x1ef0f0, 10, 10, 60, 5)
	end
	if(ret.ret == 1)
	then
		 --门位置补偿plus像素
		ret.x = ret.x + xplus
		ret.y = ret.y + yplus
		print("find gate", ret.x, ret.y)
	else
		print("not find gate")
	end
	--dump_table(ret)
	return ret
end
--找上门
function find_up_gate(drv, cap, xplus,yplus, x, y, w, h)
	local ret
	ret = cap:findColorByTvBySize(x, y, w, h, 0x69ffff, 0x68f0f0, 60, 25, 20,10)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTvBySize(x, y, w, h, 0x69ffff, 0x68f0f0, 10, 10, 60, 5)
	end
	if(ret.ret == 1)
	then
		 --门位置补偿plus像素
		ret.x = ret.x + xplus
		ret.y = ret.y + yplus
		print("find up gate", ret.x, ret.y)
	else
		print("not find up gate")
	end
	--dump_table(ret)
	return ret
end
--找下门
function find_down_gate(drv, cap, xplus, yplus, x, y, w, h)
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
		print("find down gate", ret.x, ret.y)
	else
		print("not find down gate")		
	end
	--dump_table(ret)
	return ret
end
--找右门
function find_right_gate(drv, cap, xplus, yplus, x, y, w, h)
	local ret
	ret = cap:findColorByTvBySize(x, y, w, h, 0x3c7eff, 0x3c78f0, 60, 25, 20,10)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTvBySize(x, y, w, h, 0x3c7eff, 0x3c78f0, 10, 10, 60, 5)
	end
	if(ret.ret == 1)
	then
		 --门位置补偿plus像素
		ret.x = ret.x + xplus
		ret.y = ret.y + yplus
		print("find right gate", ret.x, ret.y)
	else
		print("not find right gate")		
	end
	--dump_table(ret)
	return ret
end
--找左门 -有误差会找到所有门，但此接口不用
function find_left_gate(drv, cap, xplus,yplus, x, y, w, h)
	local ret
	ret = cap:findColorByTvBySize(x, y, w, h, 0x20ffff, 0x19fefe, 60, 25, 20,10)
	if(ret.ret == 0)
	then
		ret = cap:findColorByTvBySize(x, y, w, h, 0x20ffff, 0x19fefe, 10, 10, 60, 5)
	end
	if(ret.ret == 1)
	then
		 --门位置补偿plus像素
		ret.x = ret.x + xplus
		ret.y = ret.y + yplus
		print("find left gate", ret.x, ret.y)
	else
		print("not find left gate")
	end
	--dump_table(ret)
	return ret
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

function run_exe(win, cap, exe_path, login_tag, times)
	local ret
	--判断是否处在登陆界面
	local hwind = win:findWindow("", login_tag)
	if(0 == hwind)
	then
		--运行游戏客户端
		ret = win:runExe(exe_path)
		if(ret > 0)
		then
			local count = 0
			repeat
				sleep(5)
				count = count + 1
				hwind = win:findWindow("", login_tag)
				print("run exe to find windows:", count)
				if(count >= times)
				then
					return 0
				end
			until(hwind > 0)
			--设置窗口句柄
			cap:setHwnd(hwind)
			return hwind
		else
			return 0;
		end
	else
		--设置窗口句柄
		cap:setHwnd(hwind)
		return hwind
	end
end


-------------------------------------------------------------------------------
-----------------------------------login---------------------------------------
-------------------------------------------------------------------------------
function login_match(drv, win, cap, role_conf, step_conf, seq, ctx)
	--判断是否处在游戏界面
	local hwind = win:findWindow("", step_conf.win_name)
	if(hwind > 0)
	then
		return 0;
	end
	return 1
end
function login_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret = nil
	local ret1 = nil
	local crect = nil
	local count = 0
	
	--运行游戏客户端
	local hwind = run_exe(win, cap, step_conf.exe_path, step_conf.win_name_login, 30)
	if(0 == hwind)
	then
		print("run exe failed")
		return 0
	end
	--移动界面
	crect = reset_posi(drv, win, hwind, true)
	--确认界面1
	ret = confirm_ui(cap, step_conf.tag1, 0.9, 2)
	ret1 = confirm_ui(cap, step_conf.tag11, 0.5, 2)
	if(ret > 0 or ret1 > 0)
	then
		--登陆1
		print("to login 1")
		drv:moveTo(crect.x + 900, crect.y + 530)
		drv:leftClick(1)
		sleep(5)
	end
	
	--确认界面2
	repeat
		ret = confirm_ui(cap, step_conf.tag2, 0.8, 3)
		ret1 = confirm_ui(cap, step_conf.tag22, 0.7, 3)
	until(ret > 0 and ret1 > 0)
	
	--输入账号
	drv:moveTo(crect.x + 1110, crect.y + 350)
	sleep(1)
	drv:leftClick(2)
	drv:keyPress("delete", 15);
	drv:simulationPressKey(role_conf.user)

	--输入密码
	drv:moveTo(crect.x + 1110, crect.y + 400)
	sleep(1)
	drv:leftClick(2)
	drv:keyPress("delete", 15);
	drv:simulationPressKey(role_conf.password)
	
	--登陆2
	print("to login 2")
	drv:moveTo(crect.x + 1125, crect.y + 510)
	sleep(1)
	drv:leftClick(2)
	--ctx set
	ctx.start = true --表示从登陆界面过来的
	ctx.login = true
	sleep(60)
	return 1
end
-------------------------------------------------------------------------------
-----------------------------------first---------------------------------------
-------------------------------------------------------------------------------
function first_match(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret = 0
	local count = 0
	local hwind  = 0
	--查找客户端
	repeat
		count = count + 1
		hwind = win:findWindow("", step_conf.win_name)
		if(count > 30) then print("find game window failed");return 5 end
		if(hwind == 0) then sleep(5) end
	until(hwind > 0 )
	--移动界面
	if(ctx.start == true)--从登陆界面过来的，要调整窗口才行
	then
		reset_posi(drv, win, hwind,true)
		ctx.start = false
	else
		reset_posi(drv, win, hwind,false)
	end
	--启动cap
	cap:setHwnd(hwind)  ---cap set
	ctx.hwind = hwind   ---ctx.hwind set
	
	--确认界面
	if(ctx.login == true)
	then
		ret = confirm_ui(cap, step_conf.tag1, 0.8, 30)
	else
		ret = confirm_ui(cap, step_conf.tag1, 0.8, 1)
	end
	
	--
	if(ret > 0)
	then
		ctx.login = true
		return 1
	else
		return 0
	end


end
function first_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	--复位并获取客户端位置
	crect = reset_posi(drv, win, ctx.hwind,false)
	--
	wheels_move_up(drv, 5)
	drv:moveTo(crect.x + 130, crect.y + 180)
	sleep(1)
	drv:leftClick(1)
	--选择角色
	if(seq == 1)
	then
		print("select 1 role")
	elseif(seq == 2)
	then
		drv:keyPress("right",1)
		print("select 2 role")
	elseif(seq == 3)
	then
		drv:keyPress("right",2)
		print("select 3 role")
	elseif(seq == 4)
	then
		drv:keyPress("right",3)
		print("select 4 role")
	elseif(seq == 5)
	then
		drv:keyPress("down",1)
		print("select 5 role")
	elseif(seq == 6)
	then
		drv:keyPress("down",1)
		drv:keyPress("right",1)
		print("select 6 role")
	elseif(seq == 7)
	then
		drv:keyPress("down",1)
		drv:keyPress("right",2)
		print("select 7 role")
	elseif(seq == 8)
	then
		drv:keyPress("down",1)
		drv:keyPress("right",3)
		print("select 8 role")
	elseif(seq == 9)
	then
		drv:keyPress("down",2)
		print("select 9 role")
	elseif(seq == 10)
	then
		drv:keyPress("down",2)
		drv:keyPress("right",1)
		print("select 10 role")
	elseif(seq == 11)
	then
		drv:keyPress("down",2)
		drv:keyPress("right",2)
		print("select 11 role")
	elseif(seq == 12)
	then
		drv:keyPress("down",2)
		drv:keyPress("right",3)
		print("select 12 role")
	elseif(seq == 13)
	then
		drv:keyPress("down",3)
		print("select 13 role")
	elseif(seq == 14)
	then
		drv:keyPress("down",3)
		drv:keyPress("right",1)
		print("select 14 role")
	elseif(seq == 15)
	then
		drv:keyPress("down",3)
		drv:keyPress("right",2)
		print("select 15 role")
	elseif(seq == 16)
	then
		drv:keyPress("down",3)
		drv:keyPress("right",3)
		print("select 16 role")		
	else
		return 0
	end
	--判断是否进入下一阶段
	local ret
	local count = 0
	repeat
		count = count +  1
		--开始游戏
		drv:keyPress("space", 2);
		sleep(2)
		ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag_21, 0.7, 1)
	until(ret > 0 or count >= 10)
	if(ret > 0)
	then
		return 1  --继续
	else
		return 0  --异常程序退出
	end
	
	return 1
end
-------------------------------------------------------------------------------
-----------------------------------second---------------------------------------
-------------------------------------------------------------------------------
function second_match(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret = 0
	local ret1 = 0

	--确认界面
	if(ctx.login == true)
	then
		--确认esc
		confirm_menu(drv,win, cap, step_conf.win_name, step_conf.comm_tag1)	
		ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag1, 0.5, 5)
	else
		ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag1, 0.5, 1)
		if(ret == 1)
		then
			--确认esc
			confirm_menu(drv,win, cap, step_conf.win_name, step_conf.comm_tag1)	
			ctx.login = true
		end		
	end
	--是在此界面
	if(ret == 1)
	then
		--判断角色疲劳是否用完
		ret1 = confirm_role_finish(cap, step_conf.tag_65)	
		if(ret1 == 1)
		then
::redo::		
			switch_to_role_select(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
			--最好在确认下在角色选择的图中了
			local count = 0
			repeat
				sleep(5)
				count = count +  1
				ret = confirm_ui(cap, step_conf.tag_11, 0.8, 1)
			until(ret > 0 or count >= 10)
			if(ret > 0)
			then
				return 3  --返回上一阶段
			else
				goto redo  --??异常程序退出
			end
		end
	end
	--匹配1 未匹配0
	return ret

end
function second_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret
	local count = 0
	repeat
		count = count +  1
		role_move_down_time(drv,2)
		sleep(2)
		ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag_31, 0.6, 1)
	until(ret > 0 or count >= 5)
	if(ret > 0)
	then
		return 1  --继续
	else
		return 0  --异常程序退出
	end
end
-------------------------------------------------------------------------------
-----------------------------------three---------------------------------------
-------------------------------------------------------------------------------
function three_match(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret = 0
	--确认界面
	if(ctx.login == true)
	then
		ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag1, 0.6, 5)
	else
		ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag1, 0.6, 1)
		if(ret == 1)
		then
			ctx.login = true
		end		
	end
	return ret	
end
function three_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	local ret
	local count = 0
	repeat
		count = count +  1
		sleep(1)
		drv:keyPress("n", 1)
		sleep(3)
		--移动鼠标
		mouse_move(drv, win, ctx.hwind, 505, 460)
		sleep(1)
		drv:leftClick(1)
		sleep(1)
		drv:leftClick(1)
		sleep(2)
		drv:keyPress("n", 1)
		sleep(10)
		role_move_right_time(drv,2)
		ret = confirm_ui(cap, step_conf.tag_41, 0.8, 1)
	until(ret > 0 or count >= 5)
	if(ret > 0)
	then
		return 1  --继续
	else
		return 0  --异常程序退出
	end
end
-------------------------------------------------------------------------------
-----------------------------------four---------------------------------------
-------------------------------------------------------------------------------
function four_match(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret = 0
	--恢复back
	if(ctx.back == true)
	then
		ctx.back = false
	end
	--确认界面
	if(ctx.login == true)
	then
		ret = confirm_ui(cap, step_conf.tag1, 0.8, 5)
	else
		ret = confirm_ui(cap, step_conf.tag1, 0.8, 1)
		if(ret == 1)
		then
			ctx.login = true
		end
	end

	return ret
end
function four_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
	--获取客户端位置
	sleep(2)
	local crect = reset_posi(drv, win, ctx.hwind,false)
	--选择格兰迪发电站
	local count = 0
	repeat
		count = count + 1
		if(count > 15)
		then
			--失败返回到上一阶段
			drv:keyPress("esc", 1);
			sleep(1)
			return 2 
		end
		ret = cap:findPicByTv(step_conf.tag2, 0.8)
		dump_table(ret)
		if(ret.ret == 0)
		then
			drv:keyPress("down", 1)
			sleep(1)
		end
	until(ret.ret > 0 )	
	--选择王者模式
	count = 0	
	repeat
		count = count + 1
		if(count > 8)
		then
			--失败返回到上一阶段
			drv:keyPress("esc", 1);
			sleep(1)
			return 2 
		end		
		ret = cap:findPicByTv(step_conf.tag3, 0.8)
		dump_table(ret)
		if(ret.ret == 0)
		then
			if(count < 5)
			then
				drv:keyPress("right", 1)
			else
				drv:keyPress("left", 1)
			end
			sleep(1)
		end
	until(ret.ret > 0 )	
	sleep(1)
	ret = drv:keyPress("space", 2)
	ctx.begin =true
	return 1
end
-------------------------------------------------------------------------------
-----------------------------------five---------------------------------------
-------------------------------------------------------------------------------
function five_match(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret = 0
	--确认界面
	if(ctx.back == false)
	then
		if(ctx.login == true)
		then
			ret = confirm_ui_by_size(600,0,200,200, cap, step_conf.tag1, 0.6, 10)
		else
			ret = confirm_ui_by_size(600,0,200,200, cap, step_conf.tag1, 0.6, 1)
			if(ret == 1)
			then
				ctx.login = true
			end
		end
	else
		ret = confirm_ui_by_size(600,0,200,200, cap, step_conf.tag1, 0.6, 10)
		if(ret == 1)
		then
			ctx.login = true
		end	
		ret = 1
	end
	return ret
end


-------------use skill----------------
--放大技能，Boss专用
--[[
function use_bbskill(drv)
	math.randomseed(100)
	if(math.random(1000)%1 == 0)
	then
		local t = {'h', 'g'}
		for k,v in ipairs(t) 
		do
			drv:keyPress(v,1)
			print("bbskill 1:",v)
		end
	else
		t = {'y', 'e', 'w', 't'}
		for k,v in ipairs(t) 
		do
			drv:keyPress(v,1)
			print("bbskill 2:",v)
		end
	end
end
]]
--直接释放
function use_dskill(drv, skills, s)
	local cur_time = os.time()
	drv:keyPress(s,5)
	sleep(skills[s].freeze_time)
	skills[s].use_time = cur_time
	print("dskill :",s)
	return
end
--放大技能
function use_bskill(drv, skills, s)

	local t = {'h', 'g'}
	for k,v in ipairs(t) 
	do
		drv:keyPress(v,3)
		print("bskill 2:",v)
	end
	t = {'y', 'w', 'e', 'r', 't', 'q'}
	for k,v in ipairs(t) 
	do
		drv:keyPress(v,3)
		print("bskill 3:",v)
	end
	t = {'a', 's', 'd', 'f'}
	for k,v in ipairs(t) 
	do
		drv:keyPress(v,1)
		print("bskill 4:",v)
	end
	drv:keyPress('z',1)
	drv:keyPress('x',3)	
	print("bskill 5:x")
end
--放主技能
function use_mskill(drv,skills, s, n)
	local cur_time = os.time()
	if((cur_time - skills[s].use_time) > skills[s].fix_time)
	then
			drv:keyPress(s,3)
			sleep(skills[s].freeze_time)
			skills[s].use_time = cur_time
			print("mskill 1:", s)
			return
	end
	local t = {'q', 'w', 'e', 'r', 't', 'y'}
	for k,v in ipairs(t) 
	do
		if(((cur_time - skills[v].use_time) > skills[v].fix_time) and 
			(in_table(skills[v].use_pic, n) or  (#(skills[v].use_pic) == 0)) and
			((not in_table(skills[v].unuse_pic, n)) or  (#(skills[v].unuse_pic) == 0)))
		then
				drv:keyPress(v,3)
				sleep(skills[v].freeze_time)
				skills[v].use_time = cur_time
				print("mskill 2:", v)
				return
		end
	end
	t = {'a', 's', 'd', 'f'}
	for k,v in ipairs(t) 
	do
		if(((cur_time - skills[v].use_time) > skills[v].fix_time) and
			(in_table(skills[v].use_pic, n) or  (#(skills[v].use_pic) == 0)) and
			((not in_table(skills[v].unuse_pic, n)) or  (#(skills[v].unuse_pic) == 0)))
		then
				drv:keyPress(v,3)
				sleep(skills[v].freeze_time)
				skills[v].use_time = cur_time
				print("mskill 3:", v)
				return
		end
	end
	--drv:keyPress('z',1)
	--sleep(0.5)
	drv:keyPress('x',6)	
	print("mskill 4: x")
end
--放辅技能
function use_sskill(drv,skills, s, n)
	local cur_time = os.time()
	if((cur_time - skills[s].use_time) > skills[s].fix_time)
	then
			drv:keyPress(s,3)
			sleep(skills[s].freeze_time)
			skills[s].use_time = cur_time
			print("sskill 1:", s)
			return
	end
	local t = {'a', 's', 'd', 'f'}
	for k,v in ipairs(t) 
	do
		if(((cur_time - skills[v].use_time) > skills[v].fix_time) and
			(in_table(skills[v].use_pic, n) or  (#(skills[v].use_pic) == 0)) and
			((not in_table(skills[v].unuse_pic, n)) or  (#(skills[v].unuse_pic) == 0)))
		then
				drv:keyPress(v,3)
				sleep(skills[v].freeze_time)
				skills[v].use_time = cur_time
				print("sskill 2:", v)
				return
		end
	end
	--drv:keyPress('z',1)
	--sleep(0.5)
	drv:keyPress('x',6)
	print("sskill 3: x")
end
--x连续击打
function use_xskill(drv)
	sleep(1)
	drv:keyPress('x',6)
	print("xskill : x")
end
-------------move to boss----------------
function confirm_title_move_to_right(drv, cap, n)
	local ret
	local ret1
	local count = 0
	repeat
		count = count + 1
		ret = find_title(drv, cap)
		role_quick_move_right_dist(drv, n)
		ret1 = find_title(drv, cap)
		print("confirm title to move right", count, ret.ret, ret1.ret, ret.x, ret1.x)
	until((ret.ret > 0 and ret1.ret > 0 and ret.x ~= ret1.x) or count > 2)
end
function confirm_title_move_to_left(drv, cap, n)
	local ret
	local ret1
	local count = 0
	repeat
		count = count + 1
		ret = find_title(drv, cap)
		role_move_left_dist(drv, n)
		ret1 = find_title(drv, cap)
		print("confirm title to move left", count, ret.ret, ret1.ret, ret.x, ret1.x)
	until((ret.ret > 0 and ret1.ret > 0 and ret.x ~= ret1.x) or count > 2)
	role_move_right_dist(drv, 0)
	
end
function move_to_boss(drv, cap, xt, yt)
	local ret
	local ret1
	local retx = 0
	local rety = 0
	ret = find_boss(cap)
	if(ret.ret == 1)
	then
		--人物必须找到
		ret1 = find_title(drv, cap)
		--y方向移动
		rety = ret.y - ret1.y
		if(rety > 0)
		then
			if(rety > yt)
			then
				role_quick_move_down_dist(drv, rety)
			end	
		else
			if(-rety > yt)
			then
				role_quick_move_up_dist(drv, -rety)
			end
		end
		--x方向移动
		retx = ret.x - ret1.x
		if(retx > 0)
		then
			if(retx > xt)
			then
				--怪物在右侧
				if(retx > 300)
				then
					role_quick_move_right_dist(drv, retx - 150)
				else
					role_move_right_dist(drv,0)
				end
			end
		else
			if(-retx > xt)
			then
				--怪物在左侧
				if(-retx > 350)
				then
					role_quick_move_left_dist(drv, -retx - 200)
				else
					role_move_left_dist(drv,0)
				end			
			end		
		end
		print("move to boss to", retx, rety)
		return 1
	end
	print("move not to boss to", retx, rety)
	return 0
end


-------------move to monster----------------
function move_to_monster(drv, cap, xt, yt)
	local ret
	local ret1
	local retx = 0
	local rety = 0
	ret = find_monster(cap)
	if(ret.ret == 1)
	then
		--人物必须找到
		ret1 = find_title(drv, cap)
		--y方向移动
		rety = ret.y - ret1.y
		if(rety > 0)
		then
			if(rety > yt)
			then
				role_quick_move_down_dist(drv, rety)
			end	
		else
			if(-rety > yt)
			then
				role_quick_move_up_dist(drv, -rety)
			end
		end
		--x方向移动
		retx = ret.x - ret1.x
		if(retx > 0)
		then
			if(retx > xt)
			then
				--怪物在右侧
				if(retx > 125)
				then
					role_quick_move_right_dist(drv, retx - 50)
				else
					role_move_right_dist(drv,0)
				end
			end
		else
			if(-retx > xt)
			then
				--怪物在左侧
				if(-retx > 150)
				then
					role_quick_move_left_dist(drv, -retx - 75)
				else
					role_move_left_dist(drv,0)
				end			
			end		
		end
		print("move to monster to", retx, rety)
		return 1
	end
	print("move not to monster to", retx, rety)
	return 0
end
-------------move to tower----------------
function move_to_tower(drv, cap, xt, yt)
	local ret
	local ret1
	local retx = 0
	local rety = 0
	ret = find_tower(cap)
	if(ret.ret == 1)
	then
		--人物必须找到
		ret1 = find_title(drv, cap)
		--y方向移动
		rety = ret.y - ret1.y
		if(rety > 0)
		then
			if(rety > yt)
			then
				role_quick_move_down_dist(drv, rety)
			end	
		else
			if(-rety > yt)
			then
				role_quick_move_up_dist(drv, -rety)
			end
		end
		--x方向移动
		retx = ret.x - ret1.x
		if(retx > 0)
		then
			if(retx > xt)
			then
				--怪物在右侧
				if(retx > 100)
				then
					role_quick_move_right_dist(drv, retx - 50)
				else
					role_move_right_dist(drv,0)
				end
			end
		else
			if(-retx > xt)
			then
				--怪物在左侧
				if(-retx > 125)
				then
					role_quick_move_left_dist(drv, -retx - 75)
				else
					role_move_left_dist(drv,0)
				end			
			end		
		end
		print("move to tower to", retx, rety)
		return 1
	end
	print("move not to tower to", retx, rety)
	return 0
end
-------------move to money----------------
function move_to_money(drv, cap)
	local ret
	local ret1
	local retx = 0
	local rety = 0
	ret = find_money(drv, cap)
	if(ret.ret == 1)
	then
		--人物必须找到
		ret1 = find_title(drv, cap)
		--y方向移动
		rety = ret.y - ret1.y
		if(rety > 0)
		then
			role_quick_move_down_dist(drv, rety)
		else
			role_quick_move_up_dist(drv, -rety)
		end
		--x方向移动
		retx = ret.x - ret1.x
		if(retx > 0)
		then
			role_quick_move_right_dist(drv, retx )
		else
			role_quick_move_left_dist(drv, -retx)
		end
		print("move to money to", retx, rety)
		return 1
	end
	print("move not to money to", retx, rety)
	return 0
end

-------------hit monster----------------
function hit_monster_1(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 1", first)
	if(first == true)
	then
		--加buff
		--移动到指定位置
		confirm_title_move_to_left(drv, cap, 30)
		local count = 0
		repeat
			count = count + 1
			drv:keyPress('right',4)
			drv:keyPress('space',2)
		until(count >=1)
		--移动到指定位置
		role_quick_move_right_dist(drv, 50)
		for k,v in ipairs(skills["pic1"]["first"]) 
		do
			use_mskill(drv, skills, v, 1)
		end		
		use_xskill(drv)
	end
	--消灭怪物
	repeat
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic1"]["second"], 1)
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 1)

end
function hit_monster_2(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 2", first)
	if(first == true)
	then
		--移动到指定位置
		role_quick_move_right_dist(drv, 250)
		for k,v in ipairs(skills["pic2"]["first"]) 
		do
			use_mskill(drv, skills, v, 2)
		end			
		use_xskill(drv)
	end
	--消灭怪物
	repeat
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic2"]["second"], 2)
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 2)

end
function hit_monster_3(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 3", first)
	if(first == true)
	then
		--移动到指定位置
		role_quick_move_right_dist(drv, 285)
		--移动到指定位置
		for k,v in ipairs(skills["pic3"]["first"]) 
		do
			use_mskill(drv, skills, v, 3)
		end	
		use_xskill(drv)
	end
	--消灭怪物
	repeat
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic3"]["second"], 3)
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 3)

end
function hit_monster_4(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 4", first)
	if(first == true)
	then
		--移动到指定位置
		role_quick_move_right_down_dist(drv, 200)
		role_move_left_dist(drv, 10)
		--移动到指定位置
		for k,v in ipairs(skills["pic4"]["first"]) 
		do
			use_mskill(drv, skills, v, 4)
		end			
		use_xskill(drv)
	end
	--消灭怪物
	repeat
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic4"]["second"], 4)
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 4)

end
function hit_monster_5(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 5", first)
	if(first == true)
	then
		--向左移动到指定位置打塔
		role_quick_move_left_down_dist(drv, 175)
		--移动到指定位置
		for k,v in ipairs(skills["pic5"]["first"]) 
		do
			use_mskill(drv, skills, v, 5)
		end			
		use_xskill(drv)
	end
::redo::
	--判断塔是否已经消灭
	repeat
		ret1 = move_to_tower(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic5"]["second"], 5)
		end
	until(ret1 == 0)
	--消灭怪物
	local count = 0
	repeat
		count =  count + 1
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic5"]["second"], 5)
		end
		if(count > 6)
		then
			goto redo
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 5)
end

function hit_monster_6(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 6", first)

	--移动到指定位置
	if(first == true)
	then
		role_quick_move_right_up_dist(drv, 150)
		role_quick_move_right_dist(drv, 125)
		--移动到指定位置
		for k,v in ipairs(skills["pic6"]["first"]) 
		do
			use_mskill(drv, skills, v, 6)
		end			
		use_xskill(drv)
	else
		role_quick_move_down_dist(drv, 300)
	end
	--消灭怪物
	repeat
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic6"]["second"], 6)
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 6)

end
function hit_monster_7(drv, cap, skills, first)
	local ret
	local ret1
	print("hit monster boss", first)

	--移动到指定位置
	if(first == true)
	then
		confirm_title_move_to_right(drv, cap, 50)
		--移动到指定位置
		for k,v in ipairs(skills["pic7"]["first"]) 
		do
			use_dskill(drv, skills, v)
		end			
	end
	--消灭怪物
	repeat
		ret1 = move_to_boss(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_bskill(drv, skills, skills["pic7"]["second"])
		end
	until(ret1 == 0)

end
function hit_monster_8(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 8", first)
	if(first == true)
	then
		--移动到指定位置
		for k,v in ipairs(skills["pic8"]["first"]) 
		do
			use_mskill(drv, skills, v, 8)
		end	
		use_xskill(drv)
	end
	--消灭怪物
	repeat
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic8"]["second"], 8)
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 8)

end
function hit_monster_9(drv, cap, skills, tag, first)
	local ret
	local ret1
	local ret2
	print("hit monster 9", first)
	if(first == true)
	then
		--移动到指定位置
		for k,v in ipairs(skills["pic9"]["first"]) 
		do
			use_mskill(drv, skills, v, 9)
		end	
		use_xskill(drv)
	end
	--消灭怪物
	repeat
		ret1 = move_to_monster(drv, cap , 0, 0)
		if(ret1 == 1)
		then
			use_sskill(drv, skills, skills["pic9"]["second"], 9)
		end
		ret2 = confirm_posi(cap, tag)
	until(ret1 == 0 or ret2 ~= 9)

end
-------------pick up money----------------
function pick_money(drv, cap)
	local ret
	local count = 0
	print("pick up money")
	repeat
		count = count + 1
		ret = move_to_money(drv, cap)
		if(ret == 1)
		then
			drv:keyPress('x',2)
		end
	until(ret == 0 or count > 6)
	print("pick up money finish")
end
-------------move to gate----------------
function move_to_right_gate_pic1(drv, cap, tag)
	local posi
	local ret
	local ret1
	print("move to right gate from pic 1")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		
		if(ret1.x >= 400 and ret1.x <= 600)
		then
			role_quick_move_right_dist(drv, 250)
		elseif(ret1.x < 400)
		then
			role_quick_move_right_dist(drv, 500)
		elseif(ret1.x >= 625)
		then
			role_quick_move_left_dist(drv, 75)
		end
		--找门,门位置需要补偿
		ret = find_right_gate(drv, cap, 0, 25, 600, 0, 200, 600)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.y >= ret1.y)
			then
				role_quick_move_down_dist(drv, ret.y - ret1.y)
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
			
			if(ret.x >= ret1.x)
			then
				role_quick_move_right_dist(drv, ret.x - ret1.x)
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 1)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 1)	--没有找到退出去重来
::over::
	print("move to right gate from pic 1 over")
	return posi
end


function move_to_right_gate_pic2(drv, cap, tag)
	local posi
	local ret
	local ret1
	print("move to right gate from pic 2")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		if(ret1.y <= 300)
		then
			role_quick_move_down_dist(drv, 300)
		end
		
		if(ret1.x >= 400 and ret1.x <= 600)
		then
			role_quick_move_right_dist(drv, 300)
		elseif(ret1.x < 400)
		then
			role_quick_move_right_dist(drv, 500)
		elseif(ret1.x >= 625)
		then
			role_quick_move_left_dist(drv, 75)
		end
		--找门,门位置需要补偿
		ret = find_right_gate(drv, cap, 0, 90, 600,0, 200, 600)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.y >= ret1.y)
			then
				role_quick_move_down_dist(drv, ret.y - ret1.y)
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
			
			if(ret.x >= ret1.x)
			then
				role_quick_move_right_dist(drv, ret.x - ret1.x)
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 2)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 2)
::over::
	print("move to right gate from pic 2 over")
	return posi
end


function move_to_down_gate_pic3(drv, cap, tag)
	local posi
	local ret
	local ret1
	print("move to down gate from pic 3")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		if(ret1.y <= 300)
		then
			role_quick_move_down_dist(drv, 150)
		end
		--
		if(ret1.x <= 250)
		then
			role_quick_move_right_dist(drv, 200)
		elseif(ret1.x >= 350 and ret1.x <= 460)
		then
			role_quick_move_right_dist(drv, 80)
		end			
		--找门,门位置需要补偿
		ret = find_down_gate(drv, cap, 0, 120, 150, 200, 650, 400)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.x >= ret1.x)
			then
				role_quick_move_right_dist(drv, ret.x - ret1.x)
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end

			if(ret.y >= ret1.y)
			then
				role_quick_move_down_dist(drv, ret.y - ret1.y)
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 3)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 3)	
::over::
	print("move to down gate from pic 3 over")
	return posi
end


function move_to_down_gate_pic4(drv, cap, tag)

	local posi
	local ret
	local ret1
	print("move to down gate from pic 4")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		if(ret1.y <= 300)
		then
			role_quick_move_down_dist(drv, 100)
		end
		if(ret1.x <= 250)
		then
			role_quick_move_right_dist(drv, 200)
		elseif(ret1.x >= 360 and ret1.x <= 490)
		then
			role_quick_move_right_dist(drv, 80)
		end			
		--找门,门位置需要补偿
		ret = find_down_gate(drv, cap, 0, 120, 150, 200, 650, 400)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.x >= ret1.x)
			then
				if(ret.x - ret1.x > 200)
				then
					role_quick_move_right_dist(drv, ret.x - ret1.x)
					role_move_left_dist(drv, 0)
				else
					role_quick_move_right_dist(drv, (ret.x - ret1.x)%100)
					role_move_left_dist(drv, 0)
				end
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end

			if(ret.y >= ret1.y)
			then
				if(ret.y - ret1.y > 200)
				then
					role_quick_move_down_dist(drv, ret.y - ret1.y)
				else
					role_quick_move_down_dist(drv, (ret.y - ret1.y)%100)
				end
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 4)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 4)	
::over::	
	print("move to down gate from pic 4 over")
	return posi
end


function move_to_right_gate_pic5(drv, cap, tag)
	local posi
	local ret
	local ret1
	print("move to right gate from pic 5")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		if(ret1.y <= 400)
		then
			role_quick_move_down_dist(drv, 100)
		end		
		--
		if(ret1.x <= 600)
		then
			role_quick_move_right_dist(drv, 400)
		elseif(ret1.x >= 600)
		then
			role_quick_move_left_dist(drv, 100)
		end
		
		--找门,门位置需要补偿
		ret = find_right_gate(drv, cap, 0,50, 600, 0, 200, 600)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.y >= ret1.y)
			then
				role_quick_move_down_dist(drv, ret.y - ret1.y)
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
			
			if(ret.x >= ret1.x)
			then
				role_quick_move_right_dist(drv, ret.x - ret1.x)
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 5)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 5)	
::over::
	print("move to right gate from pic 5 over")
	return posi
end


function move_to_up_gate_pic6(drv, cap, tag)
	local posi
	local ret
	local ret1
	print("move to up gate from pic 6")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		if(ret1.y >= 400)
		then
			role_quick_move_up_dist(drv, 100)
		end
		--找门,门位置需要补偿
		ret = find_up_gate(drv, cap, 0,30,300,0, 500, 300)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.x >= ret1.x)
			then
				role_quick_move_right_dist(drv, ret.x - ret1.x)
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end

			if(ret.y >= ret1.y)
			then
				role_quick_move_down_dist(drv, ret.y - ret1.y)
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 6)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 6)	
::over::
	print("move to up gate from pic 6 over")
	return posi
end
function move_to_right_gate_pic8(drv, cap, tag)
	local posi
	local ret
	local ret1
	print("move to right gate from pic 8")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		if(ret1.x <= 600)
		then
			role_quick_move_right_dist(drv, 300)
		elseif(ret1.x >= 600)
		then
			role_quick_move_left_dist(drv, 50)
		end
		--找门,门位置需要补偿
		ret = find_right_gate(drv, cap, 0,50, 600,0, 200, 600)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.y >= ret1.y)
			then
				role_quick_move_down_dist(drv, ret.y - ret1.y)
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
			
			if(ret.x >= ret1.x)
			then
				role_quick_move_right_dist(drv, ret.x - ret1.x)
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 8)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 8)	
::over::
	print("move to right gate from pic 8 over")
	return posi
end


function move_to_right_gate_pic9(drv, cap, tag)
	local posi
	local ret
	local ret1
	print("move to right gate from pic 9")
	
	repeat
		--找人
		ret1 = find_title(drv, cap)
		if(ret1.x <= 600)
		then
			role_quick_move_right_dist(drv, 300)
		elseif(ret1.x >= 600)
		then
			role_quick_move_left_dist(drv, 50)
		end
		--找门,门位置需要补偿
		ret = find_right_gate(drv, cap, 0,50, 600,0, 200, 600)
		if(ret.ret == 1)	
		then
			ret1 = find_title(drv, cap)
			if(ret.y >= ret1.y)
			then
				role_quick_move_down_dist(drv, ret.y - ret1.y)
			else
				role_quick_move_up_dist(drv, ret1.y - ret.y)
			end	
			
			if(ret.x >= ret1.x)
			then
				role_quick_move_right_dist(drv, ret.x - ret1.x)
			else
				role_quick_move_left_dist(drv, ret1.x - ret.x)
			end
		end
		sleep(1)
		posi = confirm_posi(cap, tag)
		if(posi ~= 9)
		then
			goto over
		end
	until(ret.ret == 0 or posi ~= 9)	
::over::
	print("move to right gate from pic 9 over")
	return posi
end


-------------1----------------
function pic_1_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
	print("--------pic 1---------")
	local ret
	local first = true
	--确认此图是否完成,未完成重复刷怪
	ret = confirm_finish_by_color(cap, 1)
	while(ret == 0)
	do
		hit_monster_1(drv, cap, role_conf.skills[seq], step_conf.tag11, first)
		ctx.begin = true
		first = false
		ret = confirm_finish_by_color(cap, 1)
	end
	--捡装备
	pick_money(drv, cap)
	--加buff
	--sleep(0.5)
	--drv:keyPress('right',2)
	--sleep(0.2)
	--drv:keyPress('space',1)
	--sleep(0.5)
	--drv:keyPress('up',2)
	--sleep(0.2)
	--drv:keyPress('space',1)
	--进入下一副图
	ret = move_to_right_gate_pic1(drv, cap, step_conf.tag11)
	return ret
end
-------------2----------------
function pic_2_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	print("--------pic 2---------")
	local ret
	local first = true
	--确认此图是否完成,未完成重复刷怪
	ret = confirm_finish_by_color(cap, 2)
	while(ret == 0)
	do
		hit_monster_2(drv, cap, role_conf.skills[seq], step_conf.tag11, first)
		ctx.begin = true
		first = false
		ret = confirm_finish_by_color(cap, 2)
	end
	--捡装备
	pick_money(drv, cap)
	--进入下一副图
	ret = move_to_right_gate_pic2(drv, cap, step_conf.tag11)
	print("------pic 2 over-------")
	return ret
end
-------------3----------------
function pic_3_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	print("--------pic 3---------")
	local ret
	local first = true
	--确认此图是否完成,未完成重复刷怪
	ret = confirm_finish_by_color(cap, 3)
	while(ret == 0)
	do
		hit_monster_3(drv, cap, role_conf.skills[seq], step_conf.tag11, first)
		ctx.begin = true
		first = false
		ret = confirm_finish_by_color(cap, 3)
	end
	--捡装备
	pick_money(drv, cap)
	--进入下一副图
	ret = move_to_down_gate_pic3(drv, cap, step_conf.tag11)
	print("------pic 3 over-------")
	return ret
end
-------------4----------------
function pic_4_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	print("--------pic 4---------")
	local ret
	local ret1 = 4
	local first = true
	--确认此图是否完成,未完成重复刷怪
	ret = confirm_finish_by_color(cap, 4)
	while(ret == 0 and ret1 == 4)
	do
		hit_monster_4(drv, cap, role_conf.skills[seq], step_conf.tag11, first)
		ctx.begin = true
		first = false
		ret = confirm_finish_by_color(cap, 4)
		ret1 = confirm_posi(cap, step_conf.tag11)
	end
	--捡装备
	pick_money(drv, cap)
	--进入下一副图
	ret = move_to_down_gate_pic4(drv, cap, step_conf.tag11)
	print("------pic 4 over-------")
	return ret
end
-------------5----------------
function pic_5_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	print("--------pic 5---------")
	local ret
	local ret1 = 5
	local first = true
	--确认此图是否完成,未完成重复刷怪
	ret = confirm_finish_by_color(cap, 5)
	while(ret == 0 and ret1 == 5)
	do
		hit_monster_5(drv, cap, role_conf.skills[seq], step_conf.tag11, first)
		ctx.begin = true
		first = false
		ret = confirm_finish_by_color(cap, 5)
		ret1 = confirm_posi(cap, step_conf.tag11)
	end
	--捡装备
	pick_money(drv, cap)
	--进入下一副图
	ret = move_to_right_gate_pic5(drv, cap, step_conf.tag11)
	print("------pic 5 over-------")
	return ret
end
-------------6----------------
function pic_6_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	print("--------pic 6---------")
	local ret
	local first = true
	repeat
		--确认此图是否完成,未完成重复刷怪
		hit_monster_6(drv, cap, role_conf.skills[seq], step_conf.tag11, first)
		ctx.begin = true
		first = false
		--捡装备
		pick_money(drv, cap)
		--进入下一副图
		ret = move_to_up_gate_pic6(drv, cap, step_conf.tag11)
	until(ret ~= 6)
	print("------pic 6 over-------")
	return ret
end
-------------7----------------

function pic_7_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
	--Boss--Boss--Boss--
	print("--------pic boss---------")
	local ret
	local first = true
	local num = 0
	--确认此图是否完成,未完成重复刷怪
::redo::
	num = num + 1
	hit_monster_7(drv, cap, role_conf.skills[seq], first)
	ctx.begin = true
	first = false
	
	--确认副本完成 reward
	ret = confirm_whole_finish(cap, step_conf.tag3)
	if(ret == 1)
	then
		--确认结束
		local count = 1
		--确认黄金卡盘
		repeat
			count = count + 1
			sleep(1)
			ret = confirm_gold_pic(cap, step_conf.tag4)
			if(ret == 1)
			then
				drv:keyPress('7', 3)
			end
		until(count > 3 or ret == 1)		
		drv:keyPress('esc', 1)
		count = 0
		repeat
			count = count + 1
			ret = confirm_whole_finish2(cap, step_conf.tag2)
			if(ret == 1)
			then
				--打宝箱
				--捡装备
				drv:keyPress('NumAdd',1)
				drv:keyPress('x',10)
				sleep(0.5)
				drv:keyPress('x',10)
				--继续下一轮刷副本	
				return 0;
			end
			sleep(1)
		until(count > 10)		
	end

	--确认结束
	ret = confirm_whole_finish2(cap, step_conf.tag2)
	if(ret == 1)
	then
		--打宝箱
		--捡装备
		drv:keyPress('NumAdd',1)
		drv:keyPress('x',10)
		sleep(0.5)
		drv:keyPress('x',10)
		--继续下一轮刷副本	
		return 0;
	end
	if(num > 20)
	then
		--确认是否虚弱,回城了
		ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag_31, 0.5, 1)
		if(ret == 1)
		then
			goto over
		else
			num = 0
		end
	end
	
	goto redo
	print("------pic boss over-------")
::over::	
	return 7
end
-------------8----------------
function pic_8_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	print("--------pic 8---------")
	local ret
	--确认此图是否完成,未完成重复刷怪
	hit_monster_8(drv, cap, role_conf.skills[seq], step_conf.tag11, true)
	ctx.begin = true

	--捡装备
	pick_money(drv, cap)
	--进入下一副图
	ret = move_to_right_gate_pic8(drv, cap, step_conf.tag11)
	print("------pic 8 over-------")
	return ret
end
-------------9----------------
function pic_9_proc(drv, win, cap, role_conf, step_conf, seq, ctx)

	print("--------pic 9---------")
	local ret
	--确认此图是否完成,未完成重复刷怪
	hit_monster_9(drv, cap, role_conf.skills[seq], step_conf.tag11, true)
	ctx.begin = true

	--捡装备
	pick_money(drv, cap)
	--进入下一副图
	ret = move_to_right_gate_pic9(drv, cap, step_conf.tag11)
	print("------pic 9 over-------")
	return ret
end
------------------------------
function death_to_life(drv, win, cap, hwind)
	print("death to life")
	drv:keyPress("enter", 1)
	sleep(2)
	local crect = reset_posi(drv, win, hwind, false)
	--移动鼠标
	drv:moveTo(crect.x + 375, crect.y + 405)
	sleep(1)
	drv:leftClick(2)  --金币恢复
	sleep(4)
	role_quick_move_right_dist(drv, 200)
	sleep(3)
end
function confirm_death(drv, win, cap, step_conf, ctx)
	--确认是否虚弱,回城了
	ret = confirm_ui_by_size(500,0,300,250, cap, step_conf.tag_31, 0.5, 1)
	if(ret == 1)
	then
		death_to_life(drv, win, cap, ctx.hwind)
		return 1  --返回第三阶段
	else
		return 0
	end	
end


--返回城镇
function back_to_town(drv, win, cap, win_name, pic)
	print("switch to role select pic")
	local count = 0
	--查找客户端
	local hwind = win:findWindow("", win_name)
	--获取客户端位置
	local crect = win:getClientSize(hwind)
	--移动鼠标
	drv:moveTo(crect.x + 200, crect.y + 10)
	drv:leftClick(1)
	sleep(0.1)
::redo::
	repeat
		count = count + 1
		drv:leftClick(1)
		sleep(0.1)
		drv:keyPress("esc", 1);
		sleep(3)
		ret = cap:findPicByTvBySize(180, 90, 470, 390, pic, 0.5)
		print("switch to:",ret.ret,count)
		dump_table(ret)
	until(ret.ret > 0)
	--移动鼠标
	mouse_move(drv, win, ctx.hwind, 495, 460)
	sleep(1)
	drv:leftClick(3)
	sleep(2)
	
	ret = cap:findPicByTvBySize(180, 90, 470, 390, pic, 0.5)
	if(ret.ret > 0)
	then
		goto redo
	end
	sleep(2)
	drv:keyPress("enter", 2)
	--sleep(5)
	--death_to_life(drv, win, cap, hwind)	
end


function five_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret
	local ret1
	local ret2
	local ret3
	local posi = 0
	local count = 0
::redo::	
	ret = confirm_posi(cap, step_conf.tag11)
	repeat
		ret3 = confirm_death(drv, win, cap, step_conf, ctx)
		if(ret3 == 1)
		then
			ctx.step = 5
			ret2 = 3
			goto death
		end
		print("cur_posi, pre_posi", ret, posi)
		if(ret == 1 and (posi == 0 or posi == 1 or posi == 2))
		then
			if(ret == posi)
			then
				count = count + 1
			else
				count = 0
			end
			if(count > 15)
			then
				--back_to_town(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
				ret2 = 0
				goto death
			end
			ret1 = pic_1_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret

		elseif(ret == 2 and (posi == 1 or posi == 2 or posi == 3 or posi == 0))
		then
			if(ret == posi)
			then
				count = count + 1
			else
				count = 0
			end
			if(count > 15)
			then
				--back_to_town(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
				ret2 = 0
				goto death
			end
			ret1 = pic_2_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		elseif(ret == 3 and (posi == 2 or posi == 3 or posi == 4 or posi == 0))
		then
			if(ret == posi)
			then
				count = count + 1
			else
				count = 0
			end
			if(count > 15)
			then
				--back_to_town(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
				ret2 = 0
				goto death
			end
			ret1 = pic_3_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		elseif(ret == 4 and (posi == 3 or posi == 4 or posi == 5 or posi == 0 or posi == 8))
		then
			if(ret == posi)
			then
				count = count + 1
			else
				count = 0
			end
			if(count > 15)
			then
				--back_to_town(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
				ret2 = 0
				goto death
			end
			ret1 = pic_4_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		elseif(ret == 5 and (posi == 4 or posi == 5 or posi == 6 or posi == 0 or posi == 9))
		then
			if(ret == posi)
			then
				count = count + 1
			else
				count = 0
			end
			if(count > 15)
			then
				--back_to_town(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
				ret2 = 0
				goto death
			end
			ret1 = pic_5_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		elseif(ret == 6 and (posi == 5 or posi == 6 or posi == 0))
		then
			ret1 = pic_6_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		elseif(ret == 7 and (posi == 6 or posi == 7 or posi == 0))
		then
			ret1 = pic_7_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		elseif(ret == 8 and (posi == 4 or posi == 8 or posi == 9 or posi == 0))
		then
			if(ret == posi)
			then
				count = count + 1
			else
				count = 0
			end
			if(count > 25)
			then
				--back_to_town(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
				ret2 = 0
				goto death
			end
			ret1 = pic_8_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		elseif(ret == 9 and (posi == 5 or posi == 9 or posi == 8 or posi == 0))
		then
			if(ret == posi)
			then
				count = count + 1
			else
				count = 0
			end
			if(count > 25)
			then
				--back_to_town(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
				ret2 = 0
				goto death
			end
			ret1 = pic_9_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
			posi = ret
		else
			print("posi confirm error")
			goto redo
		end
		--
		ret = ret1
	until(ret1 == 0)
	ret2 = 1
::death::
	return ret2
end

-------------------------------------------------------------------------------
-------------------------------------six---------------------------------------
-------------------------------------------------------------------------------
function decompose_money(drv, win, cap, step_conf)
	--esc
	confirm_menu(drv,win, cap, step_conf.win_name, step_conf.comm_tag1)
	--获取客户端位置
	local crect = reset_posi(drv, win, ctx.hwind,false)
	--分解装备
	count = 0
	repeat
		count = count + 1
		if(count > 2)
		then
			return
		end
		sleep(1)
		--移动鼠标
		drv:moveTo(crect.x + 490, crect.y + 165)
		sleep(1)
		drv:leftClick(1)
		--移动鼠标
		drv:moveTo(crect.x + 490 + 55, crect.y + 165 + 55)
		sleep(1)
		drv:leftClick(1)	
		sleep(1)
		ret = cap:findPicByTv(step_conf.tag3, 0.65)
		dump_table(ret)
	until(ret.ret > 0 )	
	--分解
	sleep(1)
	drv:keyPress("a", 1)
	sleep(1)
	drv:keyPress("enter", 1)
	sleep(5)
	--esc
	--confirm_menu(drv,win, cap, step_conf.win_name, step_conf.comm_tag1)
	return

end

function six_match(drv, win, cap, role_conf, step_conf, seq, ctx)

	local count = 0
	local ret
	local ret1
	
	--清除特殊修理装备
	ctx.login = true
	ctx.begin = true
	--查找德利拉商店,存在就不需要esc
	ret1 = confirm_ui(cap, step_conf.tag4, 0.7, 1)
	if(ret1 == 0)
	then
		confirm_menu(drv,win, cap, step_conf.win_name, step_conf.comm_tag1)
	end
	--判断角色是否完成
	ret = confirm_role_finish(cap, step_conf.tag5)	
	if(ret == 1)
	then
::redo::	
		drv:keyPress("f12", 2)
		sleep(3)
		decompose_money(drv, win, cap, step_conf)
		--最好在确认下在角色选择的图中了
		switch_to_role_select(drv, win, cap, step_conf.win_name, step_conf.comm_tag1)
		local count = 0
		repeat
			sleep(5)
			count = count +  1
			ret = confirm_ui(cap, step_conf.tag_11, 0.8, 1)
		until(ret > 0 or count >= 3)
		if(ret > 0)
		then
			ctx.step = 2
			return 6  --返回第二阶段
		else
			goto redo  --??异常程序退出
		end
	end
	--检测一下包裹是否满了
	ret = confirm_ui_by_size(0, 350, 100, 130, cap, step_conf.tag1, 0.7, 1)
	if(ret > 0 and ret1 > 0)
	then
		print("check package is full")
		return 1
	end
	print("check package is not full")
	--不需要卖装备就继续刷副本
::over::
	--sleep(1)
	drv:keyPress("f10", 3)
	ctx.back = true
	return 2;
end



function six_proc(drv, win, cap, role_conf, step_conf, seq, ctx)
	local ret1
	local ret
	local count = 0
	--获取客户端位置
	local crect = reset_posi(drv, win, ctx.hwind,false)
	--查找德利拉商店位置
	repeat
		count = count + 1
		ret1 = cap:findPicByTv(step_conf.tag4, 0.7)
		if(count > 2)
		then
			goto over 
		end
		sleep(2)
	until(ret1.ret > 0 )	
	--德利拉商店
	count = 0
	repeat
		count = count + 1
		if(count > 2)
		then
			goto over 
		end
		sleep(1)
		--移动鼠标
		drv:moveTo(crect.x + ret1.x + 10, crect.y + ret1.y + 10)
		sleep(1)
		drv:leftClick(1)
		--移动鼠标
		drv:moveTo(crect.x + ret1.x + 10 + 65, crect.y + ret1.y + 10 + 35)
		sleep(1)
		drv:leftClick(1)	
		sleep(1)
		ret = cap:findPicByTv(step_conf.tag2, 0.65)
		dump_table(ret)
	until(ret.ret > 0 )	
	--出售
	sleep(1)
	drv:moveTo(crect.x + 65, crect.y + 520)
	sleep(1)
	drv:leftClick(2)	
	--装备栏
	sleep(1)
	drv:moveTo(crect.x + 495, crect.y + 275)
	sleep(1)
	drv:leftClick(2)		
	count = 0
	repeat
		count = count + 1
		--整理
		drv:moveTo(crect.x + 700, crect.y + 515)
		drv:leftClick(2)

		drv:keyDown("enter", 2)
		--卖1
		drv:moveTo(crect.x + 490, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		--卖2
		drv:moveTo(crect.x + 520, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		--卖3
		drv:moveTo(crect.x + 550, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		--卖4
		drv:moveTo(crect.x + 580, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		--卖5
		drv:moveTo(crect.x + 610, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		--卖6
		drv:moveTo(crect.x + 640, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		--卖7
		drv:moveTo(crect.x + 670, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		--卖8
		drv:moveTo(crect.x + 700, crect.y + 305)
		sleep(0.7)
		drv:leftClick(2)
		
		drv:keyUp("enter", 2)
	until(count >= 3)	
	--confirm_menu(drv,win, cap, step_conf.win_name, step_conf.comm_tag1)
	drv:keyPress("esc", 1)
::over::
	--卖完装备继续刷副本
	sleep(1)
	drv:keyPress("f10", 3)
	ctx.back = true
	return 2;
end


-------------------------------------------------------------------------------
--------------------------------gobal conf-------------------------------------
-------------------------------------------------------------------------------
lc_win_name1 = "地下城与勇士登录程序"
lc_win_name2 = "地下城与勇士"


-------------------------------------------------------------------------------
--------------------------------task conf-------------------------------------
-------------------------------------------------------------------------------

lc_role_conf ={
	user = "",
	password = "",
	roles = 0,
	skills = {},
}
lc_login_conf ={
	win_name_login = lc_win_name1,
	win_name = lc_win_name2,
	exe_path = gc_software_conf.exe_path,
	tag1 = ".\\pic\\login_tag_1.jpg",
	tag11 = ".\\pic\\login_tag_11.jpg",
	tag2 = ".\\pic\\login_tag_2.jpg",
	tag22 = ".\\pic\\login_tag_22.jpg",


}

lc_first_conf ={
	win_name = lc_win_name2,
	comm_tag1 = ".\\pic\\comm_tag_1.jpg",
	tag1 = ".\\pic\\1_tag_1.jpg",
	tag_21 = ".\\pic\\2_tag_1.jpg",

}
lc_second_conf ={
	win_name = lc_win_name2,
	comm_tag1 = ".\\pic\\comm_tag_1.jpg",
	tag1 = ".\\pic\\2_tag_1.jpg",
	tag_11 = ".\\pic\\1_tag_1.jpg",
	tag_31 = ".\\pic\\3_tag_1.jpg",
	tag_65 = ".\\pic\\6_tag_5.jpg",

}
lc_three_conf ={
	win_name = lc_win_name2,
	comm_tag1 = ".\\pic\\comm_tag_1.jpg",
	tag1 = ".\\pic\\3_tag_1.jpg",
	tag_41 = ".\\pic\\4_tag_1.jpg",
}
lc_four_conf ={
	win_name = lc_win_name2,
	comm_tag1 = ".\\pic\\comm_tag_1.jpg",
	tag1 = ".\\pic\\4_tag_1.jpg",
	tag2 = ".\\pic\\4_tag_2.jpg",
	tag3 = ".\\pic\\4_tag_3.jpg",
}
lc_five_conf ={
	win_name = lc_win_name2,
	comm_tag1 = ".\\pic\\comm_tag_1.jpg",
	tag1 = ".\\pic\\5_tag_1.jpg",
	tag2 = ".\\pic\\5_tag_2.jpg",
	tag3 = ".\\pic\\5_tag_3.jpg",
	tag4 = ".\\pic\\5_tag_4.jpg",
	tag11 = ".\\pic\\5_tag_11.png",
	tag_31 = ".\\pic\\3_tag_1.jpg",
	
}
lc_six_conf ={
	win_name = lc_win_name2,
	comm_tag1 = ".\\pic\\comm_tag_1.jpg",
	tag1 = ".\\pic\\6_tag_1.jpg",
	tag2 = ".\\pic\\6_tag_2.jpg",
	tag3 = ".\\pic\\6_tag_3.jpg",
	tag4 = ".\\pic\\6_tag_4.jpg",
	tag5 = ".\\pic\\6_tag_5.jpg",
	tag_11 = ".\\pic\\1_tag_1.jpg",
}
-------------------------------------------------------------------------------
----------------------------------context--------------------------------------
-------------------------------------------------------------------------------
ctx = {
	login = false,
	hwind = 0,
	begin = false,
	back = false,
	count = 1,
	start = false,
	step = 0,
}
-------------------------------------------------------------------------------
-----------------------------------task----------------------------------------
-------------------------------------------------------------------------------
task = {
{login_match,login_proc,lc_login_conf}, --登陆
{first_match,first_proc,lc_first_conf}, --选择角色
{second_match,second_proc,lc_second_conf}, --工会基地到伊顿工业区
{three_match,three_proc,lc_three_conf}, --伊顿工业区到副本
{four_match,four_proc,lc_four_conf}, --选择副本
{five_match,five_proc,lc_five_conf}, --刷副本
{six_match,six_proc,lc_six_conf}, --卖装备
{nil,nil,nil},
}
--循环角色主处理函数
function role_loop(drv, win, cap, role_conf, role, direct, direct_step)
	local ret = 0
	local ret1 = 0
	local ret2 = 1
	local role_count = role - 1   ----角色计数
	local i = 0                   ----步骤计数
	
	--循环角色
	repeat
		role_count = role_count + 1
		print("run to select role=", role_count)
		i = 0
		repeat
			if(direct == true)
			then
				i = 2
			else
				i = i + 1
			end	
::redo::
			if(task[i][2] ~= nil and task[i][3] ~= nil)
			then
				--match 
				----0:未匹配，继续下一个阶段
				----1:匹配，处理并继续下一个阶段
				----2:匹配，不处理并退回上一个阶段
				----3:退出，继续下一个角色
				----4:退出，继续下一个账号
				----5:退出，结束程序
				----6:退出，在某一阶段继续执行
				if(task[i][1] == nil)
				then
					ret = 1
				else
					sleep(1)
					ret = task[i][1](drv, win, cap, role_conf, task[i][3], role_count, ctx)
				end
				print(i, "stage to match,ret=",ret)
				-------match postprocess
				--match == 1, 匹配，处理并继续下一个阶段
				if(1 == ret)
				then 
					--proc 
					----0:退出游戏
					----1:继续下一个
					----2:继续上一个
					----3:退出，在某一阶段继续执行
					sleep(1)
					ret1 = task[i][2](drv, win, cap, role_conf, task[i][3], role_count, ctx)
					--process == 0, 退出游戏
					if(ret1 == 0)
					then
						ret2 = 0
						print(i, "stage to process, over, ret=", ret1)
						goto over
					--process == 0, 继续上一个阶段
					elseif(ret1 == 2)
					then
						if(i >= 2)
						then
							i = i - 1
						else
							i = 1
						end
						print(i, "stage to process, pre, ret=", ret1)
						goto redo
					elseif(ret1 == 3)
					then
						print(i, "stage to process, redo by process", ctx.step)
						i = ctx.step
						goto redo						
					else
						print(i, "stage to process, next, ret=", ret1)
						--process == 1, 继续下一个阶段
					end
					
					
				--match == 2, 匹配，不处理并退回上一个阶段
				elseif(2 == ret)
				then
					if(i >= 2)
					then
						i = i - 1
						print(i+1, "stage to process, repeat")
					else
						i = 1
						print(i, "stage to process, repeat")
					end
					goto redo
				--match == 0 未匹配，继续下一个阶段
				elseif(0 == ret)
				then
					if(direct == true) --第一阶段匹配必须执行
					then
						i = direct_step
						direct = false
						print(i, "stage to process, direct continue")
						goto redo
					end	
					print(i, "stage to process, continue")
				--match == 6 退出，在某一阶段继续执行
				elseif(6 == ret)
				then
					print(i, "stage to process, redo by match", ctx.step)
					i = ctx.step
					goto redo
				--match == 3 退出，继续下一个角色
				elseif(3 == ret)
				then
					print(i, "stage to next role")
					break
				--match == 4 退出，继续下一个账号
				elseif(4 == ret)
				then
					print(i, "stage to next account")
					ret2 = 1
					goto over
				--match == 5 退出，结束程序
				elseif(5 == ret)
				then
					print(i, "stage to quit program")
					ret2 = 0
					goto over
				end
			end
		--end  
		until(i >= #task )
	until(role_count >= role_conf.roles )
::over::	
	--return 
	----0:退出程序
	----1:继续下一个账号
	return ret2

end
-------------------------------------------------------------------------------
-----------------------------------main----------------------------------------
-------------------------------------------------------------------------------
--循环账号主处理函数
function account_proc(conf,user)
	--申请资源
	local win = WinIntf:new()
	local cap = CapIntf:new()
	if(gc_debug)
	then
		cap:setShow(true)
	end
	local drv = DrvIntf:new()
	local utils = UtilsIntf:new()
	--
	--local ret = 1
	local ret = drv:openDevice(conf.vid, conf.pid)
	if(1 == ret)
	then
		print("driver open successful")
		print("direct", gc_direct)
		--设置账号密码角色个数，开始第一个账号刷副本。gc_direct = true表示直接进副本刷，否则从登陆开始
		lc_role_conf.user = user.user
		lc_role_conf.password = user.password
		lc_role_conf.roles = user.roles
		lc_role_conf.skills = user.skills
		--参数校验
		if(gc_role < 1 or gc_role > 16) then gc_role = 1 end
		if(gc_step < 1 or gc_step > 7) then gc_step = 1 end
		--执行角色循环
		ret = role_loop(drv, win, cap, lc_role_conf, gc_role, gc_direct, gc_step)
		--下一个账号，从登陆开始，初始化数据
		gc_direct = false
		gc_step = 1
		gc_role = 1
		ctx.login = false
		ctx.hwind = 0
		ctx.begin = false
		ctx.back = false
		
	else
		print("driver open failed")
		ret = 0
	end
	--释放资源
	win:delete()
	cap:delete()
	drv:closeDevice()
	drv:delete()
	utils:delete()
	return ret
end

------------------------------
--循环账号
function account_loop()
	local ret = 1
	local count = 0
	repeat
		count = count + 1
		ret = account_proc(gc_hardware_conf, gc_users[count])
	until(ret == 0 or count >= #gc_users)
	print("script exit", ret)
end
-------------------------------------------------------------------------------
-------------------------------------end---------------------------------------
-------------------------------------------------------------------------------
function main()
	account_loop()
end
--执行程序入口
main()
