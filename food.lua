-- 当玩家受伤时总是可以吃食物，超过上限的饥饿值直接转换为血量
-- When players are hurt, they can always eat food, and any hunger exceeding the maximum is directly converted into health.
hookLib:registerLuaHook("on_eat", function(instance, itemstack, world, player)
    local over = player:getFoodStats():getPrevFoodLevel() + itemstack.field_151002_e:func_150905_g(nil) - 20
    if (over > 0) then
        player:heal(over)
    end
end, {
    targetMethod = "Lnet/minecraft/item/ItemFood;onFoodEaten(Lnet/minecraft/item/ItemStack;Lnet/minecraft/world/World;Lnet/minecraft/entity/player/EntityPlayer;)V"
})

hookLib:registerLuaHook("can_eat", function(player, always, result)
    return result or player:shouldHeal()
end, {
    targetMethod = "Lnet/minecraft/entity/player/EntityPlayer;canEat(Z)Z",
    returnCondition = "ALWAYS",
    returnType = "Z",
    injectOnExit = true,
    returnValue = true
})
