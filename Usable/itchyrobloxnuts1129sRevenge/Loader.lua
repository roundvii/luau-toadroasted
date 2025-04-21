-- loader AND itchyrobloxnuts1129's revenge coded by roundvii
-- thanks for using

-- this auto updates, load it using this script

local httpLink = "https://raw.githubusercontent.com/roundvii/vii-scripts/refs/heads/main/Usable/itchyrobloxnuts1129sRevenge/itchyrobloxnuts1129sRevenge.lua";
local httpGet = game:HttpGet(httpLink);

local LoadString = loadstring(httpGet);

if LoadString then
	LoadString();
end
