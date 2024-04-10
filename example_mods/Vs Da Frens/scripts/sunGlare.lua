local sunGlareFocus = 'boyfriend'
local angle = 0
local cameraXPosition = 0
local cameraYPosition = 0

function onCreate()
    
	makeLuaSprite('sunglare', 'sun_glare', 200, 200)
	setObjectCamera('sunglare', 'other')
    scaleObject('sunglare', 0.4, 0.4)
	addLuaSprite('sunglare', true)

end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		sunGlareFocus = 'boyfriend'
	elseif focus == 'dad' then
		sunGlareFocus = 'dad'
	end
end

function onUpdate(elapsed)
    cameraXPosition = cameraXPosition + (cameraX - cameraXPosition) / framerate
    cameraYPosition = cameraYPosition + (cameraY - cameraYPosition) / framerate
    angle = ((cameraXPosition + cameraYPosition) / math.sqrt(math.abs(cameraXPosition + cameraYPosition) + 90) * 3) - 90
	setProperty('sunglare.angle',angle)
    setProperty('sunglare.x',(cameraXPosition/10) + 200)
    setProperty('sunglare.y',(cameraYPosition/10) + 100)
end