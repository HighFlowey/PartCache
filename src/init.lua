local folder = workspace:FindFirstChild("PartCache") or Instance.new("Folder")
folder.Name = "PartCache"
folder.Parent = workspace

local module = {}

function module.new(template: BasePart|Model, preCreatedAmount: number)
	local self = {}
	self.Parts = {}

	function self.CreatePart()
		local newPart = template:Clone()

		return newPart
	end

	function self.ReturnPart(part: BasePart|Model)
		part.Parent = folder
		part:PivotTo(CFrame.new(math.huge, math.huge, math.huge))
		table.insert(self.Parts, part)
	end

	function self.GetPart(): BasePart|Model?
		local newPart = self.Parts[1]
		table.remove(self.Parts, 1)
		return newPart
	end

	for _=1, preCreatedAmount do
		local newPart = self.CreatePart()
		self.ReturnPart(newPart)
	end

	return self
end

return module