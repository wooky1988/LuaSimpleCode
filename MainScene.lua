
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"

function MainScene:onCreate()
    local path = lfs.currentdir()
    print("==============================" .. tostring(path) .. "类型：" .. type(path))
    local currentFolder = path .. "\\res"
	local input_table = {}
	self:findDirPath(currentFolder, "%.png", input_table, false)--to find .png file
	dump(input_table)
	local i=1
	while input_table[i]~=nil do
		print(input_table[i])
		i=i+1
	end
end

function MainScene:findDirPath(path, wefind, r_table, intofolder)
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local f = path..'\\'..file
			--print ("/t "..f)
			if string.find(f, wefind) ~= nil then
				--print("/t "..f)
				table.insert(r_table, f)
			end
			local attr = lfs.attributes (f)
			assert (type(attr) == "table")
			if attr.mode == "directory" and intofolder then
				findindir (f, wefind, r_table, intofolder)
			else
				for name, value in pairs(attr) do
					print (name, value)
				end
			end
		end
	end
end
return MainScene
