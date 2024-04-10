local camAngleModifier = 1.5


function onBeatHit()
	if curBeat % 2 == 0 then
		if curBeat % 4 >= 2 then
			doTweenAngle('turn', 'camHUD', camAngleModifier * 2, 0.1, 'ExpoOut')
			doTweenAngle('turnCamGame', 'camGame', camAngleModifier * 2, 0.01, 'ExpoOut')
			cancelTween('returnHUD')
			cancelTween('returnGAME')
			--doTweenAngle('turn2', 'other', camAngleModifier, 0.1, 'ExpoOut')
		else
			doTweenAngle('turn', 'camHUD', -camAngleModifier * 2, 0.1, 'ExpoOut')
			doTweenAngle('turnCamGame', 'camGame', -camAngleModifier * 2, 0.01, 'ExpoOut')
			cancelTween('returnHUD')
			cancelTween('returnGAME')
			--doTweenAngle('turn2', 'other', -camAngleModifier, 0.1, 'ExpoOut')
		end
	end
end

function onTweenCompleted(tween)
	if tween == 'turn' then
		doTweenAngle('returnHUD', 'camHUD', 0, crochet/300, 'ExpoOut')
	end
	if tween == 'turnCamGame' then
		doTweenAngle('returnGAME', 'camGame', 0, crochet/300, 'ExpoOut')
	end
end