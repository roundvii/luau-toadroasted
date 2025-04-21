--[[
    Black Hole Script
    by roundvii

    This is VERY slow, laggy and unoptimized
    Feel free to fix at your own will
]]

local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");

local Gravity = workspace.Gravity;

local Part = Instance.new("Part");
Part.Anchored = true;
Part.CanCollide = false;
Part.Shape = Enum.PartType.Ball;
Part.Position = Vector3.new(0, 50, 0);
Part.Color = Color3.fromRGB(0, 0, 0);
Part.Transparency = 0.1;
Part.Material = Enum.Material.Neon;
Part.Name = "BlackHole";

Part.Parent = workspace;

local ParticleEmitter = Instance.new("ParticleEmitter");

ParticleEmitter.Color = ColorSequence.new(Color3.fromRGB(0, 0, 0));
ParticleEmitter.Rate = 5;
ParticleEmitter.Rotation = NumberRange.new(0, 100);
ParticleEmitter.RotSpeed = NumberRange.new(0, 100);

ParticleEmitter.Parent = Part;

local AppearSound = Instance.new("Sound");
AppearSound.SoundId = "rbxassetid://18870782376";
AppearSound.Volume = 10;

AppearSound.Parent = workspace;

AppearSound:Play();

AppearSound.Ended:Connect(function()
	AppearSound:Destroy();
end)

local LoopSound = Instance.new("Sound");
LoopSound.SoundId = "rbxassetid://6878476054";
LoopSound.Volume = 10;
LoopSound.Looped = true;

LoopSound.Parent = Part;

LoopSound:Play();

Part.Size = Vector3.new(0, 0, 0);

local tweenInfo = TweenInfo.new(AppearSound.TimeLength, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
local Tween = TweenService:Create(Part, tweenInfo, {Size = Vector3.new(5, 5, 5)});
Tween:Play();

Tween.Completed:Wait();

local ClassNames =
{
	"Part",
	"MeshPart",
	"Mesh",
	"SpawnLocation",
	"Seat",
	"CornerWedgePart",
	"TrussPart",
	"WedgePart",
	"Union"
}

local Destroying = {};
local MyHint = nil;

while task.wait() do
	Part.Size += Vector3.new(0.025, 0.025, 0.025);
	
	local Descendants = {};
	local PlayerDescendants = {};
	
	for _, Descendant in ipairs(workspace:GetDescendants()) do
        task.wait();
		for _, Player in ipairs(Players:GetPlayers()) do
            task.wait();
			local Character = Player.Character or Player.CharacterAdded:Wait();
			
			for _, descendant in ipairs(Character:GetDescendants()) do
				if not table.find(PlayerDescendants, descendant) then
					table.insert(PlayerDescendants, descendant);
				end
			end
			
			if MyHint == nil then
				MyHint = Instance.new("Hint");
				
				MyHint.Text = "Teh black hole is coming, run for ur lifez! (scripted by roundvii)";
				
				MyHint.Parent = workspace;
			end
			
			if Descendant:IsA("Hint") or Descendant:IsA("Message") then
				if Descendant ~= MyHint then
					Descendant:Destroy();
				end
			end
		end
		
		-- ensure its not a player descendant, accidentally replaced this thinking i made a mistake 
		if not table.find(PlayerDescendants, Descendant) and Descendant ~= Part then
			table.insert(Descendants, Descendant);
		end
	end
	
	for _, Descendant in ipairs(Descendants) do
        task.wait();
		if table.find(ClassNames, Descendant.ClassName) and (Descendant.Position - Part.Position).Magnitude < 100 then
			if not table.find(Destroying, Descendant) then
				table.insert(Destroying, Descendant);
				
				local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
				local Tween = TweenService:Create(Descendant, tweenInfo, {CFrame = Part.CFrame, Size = Vector3.new(0, 0, 0)});

				Tween:Play();

				Tween.Completed:Connect(function()
					for i, descendant in ipairs(Destroying) do
						if descendant == Descendant then
							table.remove(Destroying, i);
						end
					end
					
					Descendant:Destroy();
				end);
			end
		end
	end
	
	for _, PlayerDescendant in ipairs(PlayerDescendants) do
        task.wait();

		local Character = PlayerDescendant.Parent;
		local Player = Players:GetPlayerFromCharacter(Character);
		
		if table.find(ClassNames, PlayerDescendant.ClassName) and Player and Character and not table.find(Destroying, Player) and (PlayerDescendant.Position - Part.Position).Magnitude < 100 then
			table.insert(Destroying, Player);

			Player.CharacterAdded:Connect(function()
				for i, descendant in ipairs(Destroying) do
					if descendant == Player then
						table.remove(Destroying, i);
					end
				end							
			end)

			local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart");

			if HumanoidRootPart then
				HumanoidRootPart.Anchored = true;

				local Humanoid = Character:FindFirstChildOfClass("Humanoid");

				if Humanoid then
					Humanoid.WalkSpeed = 0;
					Humanoid.JumpPower = 0;
					Humanoid.JumpHeight = 0;
				end

				local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out);
				local Tween = TweenService:Create(HumanoidRootPart, tweenInfo, {CFrame = Part.CFrame});

				Tween:Play();

				Tween.Completed:Connect(function()
					HumanoidRootPart.Anchored = false;

					Humanoid.Health = 0;
				end);
			end			
		end
	end
end