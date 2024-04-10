function opponentNoteHit(index, noteData, noteType, isSustain)
    if not isSustain then
        if songName ~= 'Tutorial' then
            triggerEvent('Add Camera Zoom', '0.01', '0.01')
        end
        local x = getPropertyFromGroup('strumLineNotes', noteData, 'x')
        local y = getPropertyFromGroup('strumLineNotes', noteData, 'y')
        local noteID = noteData
        local haxeCode = 'game.spawnNoteSplash(' .. x .. ', ' .. y .. ', ' .. noteID .. ');'
        opponentRating = math.random(0, 100)
        if opponentRating >= 10 then
            healthDrain(0.02)
            runHaxeCode(haxeCode)
            spawn(spawnNoteRating(index, isSustain, "ratingSick"))
            
        elseif opponentRating >= 5 then
            healthDrain(0.01)
            spawn(spawnNoteRating(index, isSustain, "ratingGood"))
            
        elseif opponentRating >= 1 then
            healthDrain(-0.01)
            spawn(spawnNoteRating(index, isSustain, "ratingBad"))
            
        else
            healthDrain(-0.03)
            spawn(spawnNoteRating(index, isSustain, "ratingUgh"))
            
        end
    end
end

function healthDrain(healthToDrain)
    if getProperty('health') > 0.2 then
        setProperty('health', getProperty('health')-healthToDrain)
    end
end

function spawnNoteRating(noteID, isSustain, ratingImageName, healthDrain)
    makeLuaSprite('OpponentRating'.. tostring(noteID), ratingImageName, getCharacterX("dad") + 200 + math.random(-5, 5), getCharacterY("dad") + 200 + math.random(-5, 5))
	setObjectCamera('OpponentRating'.. tostring(noteID), 'camGame')
	addLuaSprite('OpponentRating'.. tostring(noteID), true)
    doTweenAngle('OpponentRating'.. tostring(noteID), 'OpponentRating'.. tostring(noteID), 20 * math.random(-1, 1), 1.0, 'ExpoOut')
    doTweenX('TweenOpponentRatingScaleX', 'OpponentRating'.. tostring(noteID).. '.scale', scale, 0.3, 'ExpoIn')
	doTweenY('TweenOpponentRatingScaleY', 'OpponentRating'.. tostring(noteID).. '.scale', scale, 0.3, 'ExpoIn')
    doTweenX('TweenOpponentRatingMoveX'.. tostring(noteID), 'OpponentRating'.. tostring(noteID), getCharacterX("dad") + 200 + math.random(-5, 5), 1.0, 'ExpoOut')
    doTweenY('TweenOpponentRatingMoveY'.. tostring(noteID), 'OpponentRating'.. tostring(noteID), getCharacterY("dad") + 200 - 80, 1.0, 'ExpoOut')
    doTweenAlpha('TweenOpponentRatingAlpha'.. tostring(noteID), 'OpponentRating'.. tostring(noteID), 0, 1.0, 'ExpoOut')
end

function onTweenCompleted(tween)
    if string.starts(tween 'OpponentRating') then
	    removeLuaSprite(tween, true)
    end
end