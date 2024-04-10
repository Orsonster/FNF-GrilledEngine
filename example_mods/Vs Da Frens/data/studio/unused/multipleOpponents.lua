

-- Constants
local SPRITE_PATH = 'characters/pokemonfan8000'
local ANIMATION_FRAME_RATE = 24
local ANIMATION_LOOP = false
local SPRITE_NAME = 'pokemonfan'

-- Sprite creation and animation setup
function onCreate()
    makeAnimatedLuaSprite(SPRITE_NAME, SPRITE_PATH, 500, 50)
    addAnimationByPrefix(SPRITE_NAME, 'idle', 'Idle', ANIMATION_FRAME_RATE, ANIMATION_LOOP)
    addAnimationByPrefix(SPRITE_NAME, '0', 'Left', ANIMATION_FRAME_RATE, ANIMATION_LOOP)
    addAnimationByPrefix(SPRITE_NAME, '1', 'Down', ANIMATION_FRAME_RATE, ANIMATION_LOOP)
    addAnimationByPrefix(SPRITE_NAME, '2', 'Up', ANIMATION_FRAME_RATE, ANIMATION_LOOP)
    addAnimationByPrefix(SPRITE_NAME, '3', 'Right', ANIMATION_FRAME_RATE, ANIMATION_LOOP)
    objectPlayAnimation(SPRITE_NAME, 'idle')
    addLuaSprite(SPRITE_NAME, true)
end

-- Handle beat hits
function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation(SPRITE_NAME, 'idle')
    end
end

-- Store last opponent's note
local lastNote = {0, ""}

-- Handle opponent's note hit
function opponentNoteHit(id, direction, time, step)
    lastNote[1] = direction
    lastNote[2] = step
    
    if lastNote[2] == "No Animation" then
        objectPlayAnimation(SPRITE_NAME, lastNote[1])
    end
end
