-- 将骷髅的最大血量削弱为5点
-- Reduce skeletons' max health from 20 to 5
hookLib:registerLuaEvent("cpw.mods.fml.common.event.FMLPreInitializationEvent", function(event)
    SharedMonsterAttributes = luajava.bindClass("net.minecraft.entity.SharedMonsterAttributes")
end)

hookLib:registerLuaHook("skeleton", function(entity)
    entity:getEntityAttribute(SharedMonsterAttributes.maxHealth):setBaseValue(5)
end, {
    targetMethod = "Lnet/minecraft/entity/monster/EntitySkeleton;applyEntityAttributes()V",
    injectOnExit = true
})
