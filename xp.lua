-- 玩家死亡不掉落经验，升级的经验固定为47点
-- Players do not drop experience upon death, and the experience required for leveling up is fixed at 47 points.
hookLib:registerLuaHook("get_xp_points", function(instance, player)
    return 0
end, {
    targetMethod = "Lnet/minecraft/entity/player/EntityPlayer;getExperiencePoints(Lnet/minecraft/entity/player/EntityPlayer;)I",
    returnCondition = "ALWAYS",
    returnType = "I"
})

hookLib:registerLuaHook("clone_player", function(instance, player, all)
    if (not (all or instance.worldObj:getGameRules():getGameRuleBooleanValue("keepInventory"))) then
        instance.experienceLevel = player.experienceLevel
        instance.experienceTotal = player.experienceTotal
        instance.experience = player.experience
        instance:setScore(player:getScore())
    end
end, {
    targetMethod = "Lnet/minecraft/entity/player/EntityPlayer;clonePlayer(Lnet/minecraft/entity/player/EntityPlayer;Z)V"
})

hookLib:registerLuaHook("xp_bar_cap", function(instance)
    return 47
end, {
    targetMethod = "Lnet/minecraft/entity/player/EntityPlayer;xpBarCap()I",
    returnCondition = "ALWAYS",
    returnType = "I"
})
