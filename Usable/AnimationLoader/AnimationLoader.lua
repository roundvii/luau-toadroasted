local Players = game:GetService("Players");
local Player = Players.LocalPlayer;

local AnimationId = "http://www.roblox.com/Asset?ID=27789359";

local function CharacterAdded(Character: Model)
    local Humanoid = Character:WaitForChild("Humanoid");

    if Humanoid then
        local Animator = Humanoid:WaitForChild("Animator");
        local Animation = Instance.new("Animation");
        Animation.AnimationId = AnimationId;

        local AnimationTrack = Animator:LoadAnimation(Animation);

        AnimationTrack:Play();
    end
end

local Character = Player.Character or Player.CharacterAdded:Wait();

if Character then
    CharacterAdded(Character);
end