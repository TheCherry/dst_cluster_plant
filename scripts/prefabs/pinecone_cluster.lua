--Here for quickly changing object being planted
local name = "pinecone"

local assets =
{
    Asset("ANIM", "anim/"..name..".zip"),
}

local function OnBuild(inst)
    inst.components.clusterplantable:BuildCluster(inst)
    --Helper is done planting, remove self
    inst:Remove()
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
    inst.entity:AddNetwork()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.entity:SetPristine()

    --Cluster plantabilty
    inst:AddComponent("clusterplantable")
    inst.components.clusterplantable:InitCondition("evergreen_short", name, TUNING.PINECONE_CLUSTER_SIZE, TUNING.PINECONE_CLUSTER_INGRD)
    inst:ListenForEvent("onbuilt", OnBuild)

	return inst
end

return Prefab("common/"..name.."_cluster", fn, assets),	
    MakePlacer("common/dug_"..name.."_placer", name, name, "idle")