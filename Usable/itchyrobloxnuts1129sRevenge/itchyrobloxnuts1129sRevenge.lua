local Workspace = game:GetService("Workspace");
local Players = game:GetService("Players");
local Lighting = game:GetService("Lighting");

local Descendants = Workspace:GetDescendants();

local DecalFaces =
{
	"Top",
	"Bottom",
	"Left",
	"Right",
	"Front",
	"Back"
};

local DecalTexture = "rbxassetid://74925362971536";

for _, Descendant in ipairs(Descendants) do
	if Descendant:IsA("BasePart") then
		for _, DecalFace in ipairs(DecalFaces) do
			local Decal = Instance.new("Decal");

			Decal.Texture = DecalTexture;
			Decal.Face = DecalFace;

			Decal.Name = "itchyrobloxnuts1129";

			Decal.Parent = Descendant;
		end

		local ParticleEmitter = Instance.new("ParticleEmitter");

		ParticleEmitter.Name = "itchyrobloxnuts1129";

		ParticleEmitter.Texture = DecalTexture;

		ParticleEmitter.Parent = Descendant;

		local Sky = Lighting:FindFirstChildOfClass("Sky");

		if not Sky then
			Sky = Instance.new("Sky");
			Sky.Parent = Lighting;
		end

		Sky.SkyboxBk, Sky.SkyboxDn, Sky.SkyboxFt, Sky.SkyboxLf, Sky.SkyboxRt, Sky.SkyboxUp = DecalTexture, DecalTexture, DecalTexture, DecalTexture, DecalTexture, DecalTexture;

		Sky.CelestialBodiesShown = false;
		
		local FakeSky = workspace:FindFirstChild("itchyrobloxnuts1129_sky");
		
		if not FakeSky then
			FakeSky = Instance.new("Part");
			FakeSky.Size = Vector3.new(800, 800, 800);
			FakeSky.Position = Vector3.new(0, 0, 0);
			FakeSky.Anchored = true;
			FakeSky.CanCollide = false;
			FakeSky.Name = "itchyrobloxnuts1129_sky";
			
			local SpecialMesh = Instance.new("SpecialMesh");
			
			SpecialMesh.MeshId = "rbxassetid://6946723023";
			SpecialMesh.TextureId = DecalTexture;
			SpecialMesh.Scale = FakeSky.Size;
			
			SpecialMesh.Parent = FakeSky;
			
			FakeSky.Parent = workspace;
		end
	end
end

for _, Player in ipairs(Players:GetPlayers()) do
	local Character = Player.Character or Player.CharacterAdded:Wait();

	if Character then
		local Humanoid = Character:FindFirstChildOfClass("Humanoid");

		if Humanoid then
			Humanoid.Health = 0.1;
		end
	end
end