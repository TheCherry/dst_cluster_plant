local Clusterplantable = Class(function(self, inst)
    self.inst = inst
    self.name = nil --What the object being planted will become
    self.size = nil --Size of the grid
    self.seed = nil --What the object being planted is
    self.ingrd = {} --Table of ingredients and the number of each ingredient used in recipe
end)

--Initializes all the variables used in the class Clusterplantable
--Used by prefabs to set the options
function Clusterplantable:InitCondition(name, seed, size, ingrd)
    self.name = name
    self.size = size
    self.seed = seed
    self.ingrd = ingrd
end

--GetOffset
--Sets the value of the space around an object
local function GetOffset(name)
    if name == "sapling" or name == "grass" then
        return 0
    elseif name == "pinecone" then
        return 4
    else
        return 2
    end
end

--PlantIt--
--Separates platables from pinecones and plants things
--Also handles refunding of materials if an object cannot be planted
local function PlantIt(self, refpt, spawnpt, offset)
    local refunds = 0
    for k, v in pairs(spawnpt) do
        if v.x ~= refpt.x or v.z ~= refpt.z then        
            local obj = SpawnPrefab(self.seed)
            local test = obj.components.deployable:CanDeploy(Point(v.x, v.y, v.z))
            obj:Remove()
            if test then
                obj = SpawnPrefab(self.name)
                if self.seed ~= "pinecone" then
                    obj.components.pickable:OnTransplant()
                end
                obj.Transform:SetPosition(v.x, v.y, v.z)
            else
                refunds = refunds + 1
            end
        end
    end

    if refunds ~= 0 then
        print(refunds)
        refunds = refunds + 1 --Used to account for having refund the center
        for k, v in pairs(self.ingrd) do
            local runs = nil --Used to regulate how many things are being refunded
            --Set the number of seeds to refund
            if v.ingrd == self.seed then
                runs = refunds
            --Set the number of materials to refund
            else
                runs = (refunds * v.num)/(self.size.x * self.size.z)
            end
            --Do the refunds
            for i = 1, runs, 1 do
                local obj = SpawnPrefab(v.ingrd)
                obj.Transform:SetPosition(refpt.x, refpt.y, refpt.z)
            end
        end
    else
        local obj = SpawnPrefab(self.name)
        obj.Transform:SetPosition(refpt.x, refpt.y, refpt.z)
        if self.seed ~= "pinecone" then --Pinecones/trees aren't pickable
            obj.components.pickable:OnTransplant()
        end
    end
end

function Clusterplantable:BuildCluster(node)
    --Get minimum spacing
    local offset = GetOffset(self.name)
    --Get the center reference point
    local refpt = Vector3(node.Transform:GetWorldPosition())
    --Grid size from options, use as boundaries for grid
    local xop, zop = self.size.x, self.size.z
    --Set start position for grid ('bottem-left')
    local xshift, zshift = (xop/2 - 0.5), (zop/2 - 0.5) 
    local xstart, zstart = (refpt.x - xshift - (xshift * offset)), (refpt.z - zshift - (zshift * offset))
    --Set the spawn points
    local spawn_pts= {}
    for kz = 0, zop - 1, 1 do
        local osx, osz = offset, offset
        for kx = 0, xop - 1, 1 do
            table.insert(spawn_pts, { x = (xstart + (kx * osx) + kx), y = (refpt.y), z = (zstart + (kz * osz) + kz) })
        end
    end
    --Plant the thing
    PlantIt(self, refpt, spawn_pts, offset)
end

return Clusterplantable