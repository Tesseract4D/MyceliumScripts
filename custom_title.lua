--Customize your game title.
hookLib:registerLuaHook("custom title", function(mc)
    local title = "Your Title"
    luajava.bindClass("org.lwjgl.opengl.Display"):setTitle(title)
end, {
    targetMethod = "Lnet/minecraft/client/Minecraft;startGame()V",
    injectOnInvoke = "Lorg/lwjgl/opengl/Display;setTitle(Ljava/lang/String;)V",
    injectOnExit = true
})