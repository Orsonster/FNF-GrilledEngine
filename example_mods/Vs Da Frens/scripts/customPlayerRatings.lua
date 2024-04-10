-- NOTE, this script is made for DISABLED RATINGS, if you need help disabling ratings and combo, try this
--function onCreatePost() 
--  setProperty('showRating', false);
--  setProperty('showComboNum', false);
--end
local xOffset = -100
local yOffset = 40

function goodNoteHit(noteID, noteDirection, noteType, isSustain)
    if not isSustain then
        if songName ~= 'Tutorial' then
            triggerEvent('Add Camera Zoom', '0.01', '0.01')
        end
			
        if getPropertyFromGroup('notes',noteID,'rating') == 'sick' then
            spawn(spawnNoteRating(noteID, isSustain, "ratingSick"))
        elseif getPropertyFromGroup('notes',noteID,'rating') == 'good' then
            spawn(spawnNoteRating(noteID, isSustain, "ratingGood"))
        elseif getPropertyFromGroup('notes',noteID,'rating') == 'bad' then
            spawn(spawnNoteRating(noteID, isSustain, "ratingBad"))
        else
            spawn(spawnNoteRating(noteID, isSustain, "ratingUgh"))
        end   
    end
end


function spawnNoteRating(noteID, isSustain, ratingImageName)
    makeLuaSprite('Rating'.. tostring(noteID), ratingImageName, getCharacterX("bf")+xOffset + math.random(-5, 5), getCharacterY("bf")+yOffset +150 + math.random(-5, 5))
	setObjectCamera('Rating'.. tostring(noteID), 'camGame')
	addLuaSprite('Rating'.. tostring(noteID), true)
    doTweenAngle('Rating'.. tostring(noteID), 'Rating'.. tostring(noteID), 20 * math.random(-1, 1), 1.0, 'ExpoOut')
    doTweenX('TweenRatingScaleX', 'Rating'.. tostring(noteID).. '.scale', 0, 0.3, 'ExpoIn')
	doTweenY('TweenRatingScaleY', 'Rating'.. tostring(noteID).. '.scale', 0, 0.3, 'ExpoIn')
    doTweenX('TweenRatingMoveX'.. tostring(noteID), 'Rating'.. tostring(noteID), getCharacterX("bf")+xOffset + math.random(-5, 5), 1.0, 'ExpoOut')
    doTweenY('TweenRatingMoveY'.. tostring(noteID), 'Rating'.. tostring(noteID), getCharacterY("bf")+yOffset +150 - 80, 1.0, 'ExpoOut')
    doTweenAlpha('TweenRatingAlpha'.. tostring(noteID), 'Rating'.. tostring(noteID), 0, 1.0, 'ExpoOut')
end

function onTweenCompleted(tween)
    if string.starts(tween 'Rating') then
	    removeLuaSprite(tween, true)
    end
end