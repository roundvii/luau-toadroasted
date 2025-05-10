local Players = game:GetService("Players");
local Player = Players.LocalPlayer;

local TweenService = game:GetService("TweenService");

local Character = Player.Character or Player.CharacterAdded:Wait();
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart");

for _, _Player in ipairs(Players:GetPlayers()) do
	local _Character = _Player.Character;
	
	if _Character then
		local _HumanoidRootPart = _Character:WaitForChild("HumanoidRootPart");

		local tweenInfo = TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
		local Tween = TweenService:Create(HumanoidRootPart, tweenInfo, {CFrame = _HumanoidRootPart.CFrame});

		Tween:Play();

		Tween.Completed:Wait();		
	end
end