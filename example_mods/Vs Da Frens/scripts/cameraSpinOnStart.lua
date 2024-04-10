

function onCreate()
    doTweenAngle('spinCamGame', 'camGame', 360, 0.01, 'ExpoOut')
end

function onTweenCompleted(tween)
	if tween == 'spinCamGame' then
		doTweenAngle('returnGAMESPIN', 'camGame', 0, crochet/300, 'CircOut')
	end
end