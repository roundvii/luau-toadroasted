local Tick = tick();

math.randomseed(Tick % 1 * 1e6);

local Lighting = game:GetService("Lighting");
local Players = game:GetService("Players");

local Skybox = task.spawn(function()
	while task.wait(0.3) do
		local Sky = Lighting:FindFirstChildOfClass("Sky");

		if not Sky then
			Sky = Instance.new("Sky");
			Sky.Parent = Lighting;
		end

		Sky.SkyboxBk, Sky.SkyboxDn, Sky.SkyboxFt, Sky.SkyboxLf, Sky.SkyboxRt, Sky.SkyboxUp = "rbxassetid://201208408", "rbxassetid://201208408", "rbxassetid://201208408", "rbxassetid://201208408", "rbxassetid://201208408", "rbxassetid://201208408";

		Sky.CelestialBodiesShown = false;
		
		local FakeSky = workspace:FindFirstChild("FAKETOADSKY");
		
		if not FakeSky then
			FakeSky = Instance.new("Part");
			FakeSky.Size = Vector3.new(800, 800, 800);
			FakeSky.Position = Vector3.new(0, 0, 0);
			FakeSky.Anchored = true;
			FakeSky.CanCollide = false;

			FakeSky.Name = "FAKETOADSKY";
			
			local SpecialMesh = Instance.new("SpecialMesh");
			
			SpecialMesh.MeshId = "rbxassetid://6946723023";
			SpecialMesh.TextureId = "rbxassetid://201208408";
			SpecialMesh.Scale = FakeSky.Size;
			
			SpecialMesh.Parent = FakeSky;
			
			FakeSky.Parent = workspace;
		end
	end
end)

local function CreateMusic()
	local s = Instance.new("Sound");
	s.Parent = workspace;

	s.SoundId = "rbxassetid://6714850437"
	s.Name = "TOADROASTED";
	
	s.Looped = true;
	s.Volume = math.huge;
	
	local DistortionSoundEffect = Instance.new("DistortionSoundEffect");
	DistortionSoundEffect.Level = 0.9;
	DistortionSoundEffect.Priority = math.huge;
	
	DistortionSoundEffect.Parent = s;
	
	s:Play();	
	
	return s;
end

local Sound = task.spawn(function()
	CreateMusic();
	
	while task.wait(0.2) do
		local FindMusic = workspace:FindFirstChild("TOADROASTED");
		
		if not FindMusic then
			CreateMusic();
		end
	end
end)

local Messages = task.spawn(function()
	while task.wait(0.3) do
		for _, Child in ipairs(workspace:GetChildren()) do
			if Child:IsA("Message") or Child:IsA("Hint") then
				Child:Destroy();
			end
		end
		
		local Message = Instance.new("Message");
		
		Message.Text = "Get toadroasted you bacon haired bozos!";
		
		Message.Parent = workspace;
		
		task.wait(0.3);
		
		Message:Destroy()
	end
end)

local Rain = task.spawn(function()
	while task.wait(10 % 1 * 1e2) do
		local MeshPart = Instance.new("Part");
		MeshPart.Name = "BUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUPBUP";
		MeshPart.CanCollide = false;
		MeshPart.Size = Vector3.new(440, 530, 380);
		MeshPart.Position = Vector3.new(math.random(-3000,1000), math.random(1,3000), math.random(-3000,3000));
		
		local SpecialMesh = Instance.new("SpecialMesh");
		
		SpecialMesh.MeshId = "rbxassetid://1009824073";
		SpecialMesh.TextureId = "rbxassetid://1009824086";
		SpecialMesh.MeshType = "FileMesh";
		
		SpecialMesh.Parent = MeshPart;
		
		MeshPart.Parent = workspace;
		
		local sound = Instance.new("Sound");
		
		sound.SoundId = "rbxassetid://513492655";
		
		sound.Volume = math.huge;
		
		local DistortionSoundEffect = Instance.new("DistortionSoundEffect");
		DistortionSoundEffect.Level = 0.9;
		DistortionSoundEffect.Priority = math.huge;

		DistortionSoundEffect.Parent = sound;
		
		sound:Play();
		
		sound.Ended:Connect(function()
			sound:Destroy();
		end)
	end
end);

local function CharacterAdded(Character: Model)
	local Torso = Character:WaitForChild("Torso");
	
	if Torso then
		local SpecialMesh = Instance.new("SpecialMesh");
		SpecialMesh.Name = "bup";

		SpecialMesh.Scale = Vector3.new(0.1, 0.1, 0.1);

		SpecialMesh.MeshId = "rbxassetid://1009824073";
		SpecialMesh.TextureId = "rbxassetid://1009824086";
		
		SpecialMesh.Parent = Torso;
	end
	
	for _, Child in ipairs(Character:GetChildren()) do
		if Child:IsA("BasePart") and Child.Transparency ~= 1 and Child ~= Torso then
			Child.Transparency = 1;
		end
		
		if Child:IsA("Accessory") then
			Child:Destroy();
		end
	end
end

local SetCharacter = task.spawn(function()
	Players.PlayerAdded:Connect(function(Player: Player)
		Player.CharacterAdded:Connect(CharacterAdded)
	end)
	
	for _, Player in ipairs(Players:GetPlayers()) do
		local Character = Player.Character or Player.CharacterAdded:Wait();
		
		CharacterAdded(Character);
		
		Player.CharacterAdded:Connect(CharacterAdded);
	end
end)

local DestroyModels = task.spawn(function()
	while task.wait(0.5) do
		for _, Descendant in ipairs(workspace:GetChildren()) do
			if Descendant:IsA("Model") then
				local Player = Players:GetPlayerFromCharacter(Descendant);
				
				if not Player then
					Descendant:Destroy();
				end
			end
		end
	end
end)

local Hints = task.spawn(function()
	while task.wait(1) do
		local Hint = Instance.new("Hint");
		
		Hint.Text = "toadroasted remade by roundvii on disc";
		Hint.Parent = workspace;
		
		task.wait(1.5);
		
		Hint:Destroy();
	end
end)
