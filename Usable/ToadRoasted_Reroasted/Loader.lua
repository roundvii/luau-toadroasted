-- loader AND toadroasted coded by roundvii
-- thanks for using

-- this auto updates, load it using this script

local httpLink = "https://raw.githubusercontent.com/roundvii/vii-scripts/refs/heads/main/Usable/ToadRoasted_Reroasted/Toadroasted_Reroasted.lua";
local httpGet = game:HttpGet(httpLink);

local LoadString = loadstring(httpGet);

if LoadString then
	LoadString();
end
