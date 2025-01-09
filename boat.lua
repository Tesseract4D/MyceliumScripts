-- 船不会撞碎
-- Boats won't break
hookLib:registerLuaHook("boat", function(entity)
    entity.isCollidedHorizontally = false
end, {
    targetMethod = "Lnet/minecraft/entity/item/EntityBoat;onUpdate()V",
    injectOnInvoke = "Lnet/minecraft/entity/item/EntityBoat;moveEntity(DDD)V",
    injectOnExit = true
})
