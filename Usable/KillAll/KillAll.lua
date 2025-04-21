local Players = game:GetService("Players");

local Classes =
{
	"Part",
	"MeshPart",
	"Mesh"
}

for _, Player in ipairs(Players:GetPlayers()) do
	local Character = Player.Character or Player.CharacterAdded:Wait();

	if Character then
		local Humanoid = Character:FindFirstChildOfClass("Humanoid");

		if Humanoid then
			Humanoid.Health = 0;
			task.wait();
		end

		for _, Child in ipairs(Character:GetChildren()) do
			if table.find(Classes, Child.ClassName) then
				local BigForce = Vector3.new(math.random(-100, 100), math.random(100, 1000), math.random(-100, 100));

				Child:ApplyImpulse(BigForce);
			end
		end
	else
		warn(Character.Name .. "gets to live another day FAAART");
	end
end