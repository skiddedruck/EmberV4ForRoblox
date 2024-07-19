local function vapeGithubRequest(scripturl)
	if not isfile("ember/"..scripturl) then
		local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/skiddedruck/EmberV4ForRoblox/"..readfile("ember/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then return nil end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("ember/"..scripturl, res)
	end
	return readfile("ember/"..scripturl)
end

shared.CustomSaveVape = 6403373529
if isfile("ember/CustomModules/6403373529.lua") then
	loadstring(readfile("ember/CustomModules/6403373529.lua"))()
else
	local publicrepo = vapeGithubRequest("CustomModules/6403373529.lua")
	if publicrepo then
		loadstring(publicrepo)()
	end
end
