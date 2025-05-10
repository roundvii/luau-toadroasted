local HttpGet = game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/refs/heads/master/source");
local Loadstring = loadstring(HttpGet);

if Loadstring then
    print("Loaded successfully");
    Loadstring();
else
    warn("Did not load script");
end