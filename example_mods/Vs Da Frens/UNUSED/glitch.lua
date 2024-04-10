local shaderName = "glitch"
function onCreate()

    makeLuaSprite("glitch")
    --makeGraphic("shaderImage", screenWidth, screenHeight)

    setSpriteShader("boyfriend", "glitch")   
    --game.initLuaShader(shaderName);
end

function onUpdate(elapsed)
    
    setShaderFloat('glitch','time',elapsed)
    --setShaderFloat('glitch','prob',100)
 end
