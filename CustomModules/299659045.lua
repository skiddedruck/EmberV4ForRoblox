local function vapeGithubRequest(scripturl)
	if not isfile("vapev4ember/"..scripturl) then
		local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/skiddedruck/EmberV4ForRoblox/"..readfile("vapev4ember/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then return nil end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("vapev4ember/"..scripturl, res)
	end
	return readfile("vapev4ember/"..scripturl)
end

shared.CustomSaveVape = 292439477
if pcall(function() readfile("vapev4ember/CustomModules/292439477.lua") end) then
	loadstring(readfile("vapev4ember/CustomModules/292439477.lua"))()
else
	local publicrepo = vapeGithubRequest("CustomModules/292439477.lua")
	if publicrepo then
		loadstring(publicrepo)()
	end
end
