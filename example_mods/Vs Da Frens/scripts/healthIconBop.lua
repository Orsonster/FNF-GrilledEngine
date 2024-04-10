local angle = -6

function onBeatHit()
	setProperty('iconP1.angle',angle)
	setProperty('iconP2.angle',-angle)
	setProperty('animatedicon.angle',-angle)
	doTweenAngle('iconP1Bop', 'iconP1', 0, 0.5, 'ExpoOut')
	doTweenAngle('iconP2Bop', 'iconP2', 0, 0.5, 'ExpoOut')
	doTweenAngle('animatediconBop', 'animatedicon', 0, 0.5, 'ExpoOut')
end