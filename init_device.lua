--执行程序入口
function init_task_to_run()
	print("run init_task_to_run")
	drv = DrvIntf:new()
	ret = drv:setSpeed(10, 10, 10)
	if(1 == ret)
	then
		print("setSpeed sucessful")
	else
		print("setSpeed failed")
	end
	return 1
end

--结束程序入口
function fini_task_to_stop()
	print("run fini_task_to_stop")
	return 1
end