local Lighting = game:GetService("Lighting");

local Sky = Lighting:FindFirstChildOfClass("Sky");

if not Sky then
	Sky = Instance.new("Sky");
	Sky.Parent = Lighting;
end

Sky.SkyboxBk = "rbxassetid://8174290513";
Sky.SkyboxUp = "rbxassetid://8174290513";
Sky.SkyboxLf = "rbxassetid://8174290513";
Sky.SkyboxRt = "rbxassetid://8174290513";
Sky.SkyboxDn = "rbxassetid://8174290513";
Sky.SkyboxFt = "rbxassetid://8174290513";

local Players = game:GetService("Players");

local TweenService = game:GetService("TweenService");
local tweenInfo = TweenInfo.new(2);

for _, Player in ipairs(Players:GetPlayers()) do
	local PlayerGui = Player.PlayerGui;
	local Character = Player.Character or Player.CharacterAdded:Wait();

	if Character then
		local Humanoid = Character:FindFirstChildOfClass("Humanoid");

		if Humanoid then
			Humanoid.WalkSpeed = 0;
			Humanoid.JumpHeight = 0;
			Humanoid.JumpPower = 0;
		end

		task.spawn(function()

		local MeshPart = Instance.new("MeshPart");
		MeshPart.Name = "Spunch bab";
		MeshPart.Anchored = true;
		MeshPart.CanCollide = false;

		MeshPart.Size = Vector3.new(15.336, 23.549, 5.943);

		MeshPart:PivotTo(Character:GetPivot());

		MeshPart.Parent = workspace;

		-- MeshPart.MeshId = "rbxassetid://5730254628";
		MeshPart.TextureID = "rbxassetid://5730254691"

		local TargetPos = MeshPart.Position;

		MeshPart.Position -= Vector3.new(0, 8.496, 0);

		local Tween = TweenService:Create(MeshPart, tweenInfo, {Position = TargetPos});

		Tween:Play();

		task.wait(tweenInfo.Time / 2);

		local Sound = Instance.new("Sound");
		Sound.Volume = 10;
		
		Sound.SoundId = "rbxassetid://1230832372";
		Sound.Parent = MeshPart;
		Sound:Play();
		Sound.Ended:Connect(function()
			Sound:Destroy()
		end)

		local Sound2 = Instance.new("Sound");

		Sound.SoundId = "rbxassetid://840202110";
		Sound.Parent = MeshPart;

		Sound.PlayOnRemove = true;

		task.wait(Sound.TimeLength);

		local ScreenGui = Instance.new("ScreenGui");

		local ImageLabel = Instance.new("ImageLabel");
		ImageLabel.Image = "rbxassetid://18930058290";

		ImageLabel.AnchorPoint = Vector2.new(1, 1);
		ImageLabel.Position = UDim2.new(1, 0, 1, 0);
		ImageLabel.Size = UDim2.new(1, 0, 1, 0);

		MeshPart:Destroy();

		ScreenGui.Parent = PlayerGui;

		task.spawn(function()
			task.wait(2);

			if ScreenGui then
				ScreenGui:Destroy();
			end

			if Humanoid then
				Humanoid.Health = 0;
			end
		end);
		end);
	end
end