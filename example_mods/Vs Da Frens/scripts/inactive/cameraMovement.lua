cameraOffsetX = 0
cameraOffsetY = 0
local intensity = 20
local currentCameraPosition = 0
local cameraX = getProperty('camFollow.x');
local cameraY = getProperty('camFollow.y');
local dadX = getProperty('dad.x');
local dadY = getProperty('dad.y');
local gfX = getProperty('gf.x');
local gfY = getProperty('gf.y');

function goodNoteHit(noteID, noteDirection, noteType, isSustain)
   local boyfriendX = getProperty('boyfriend.x');
   local boyfriendY = getProperty('boyfriend.y');
   if noteDirection == 0 then
      cameraOffsetX = -1 * intensity
   elseif noteDirection == 1 then
      cameraOffsetY = -1 * intensity
   elseif noteDirection == 2 then
      cameraOffsetY = 1 * intensity
   elseif noteDirection == 3 then
      cameraOffsetX = 1 * intensity
   end
end

function opponentNoteHit(noteID, noteDirection, noteType, isSustain)
   
   if noteDirection == 0 then
      cameraOffsetX = -1 * intensity
   elseif noteDirection == 1 then
      cameraOffsetY = -1 * intensity
   elseif noteDirection == 2 then
      cameraOffsetY = 1 * intensity
   elseif noteDirection == 3 then
      cameraOffsetX = 1 * intensity
   end
end

function onUpdatePost(elapsed)
   cameraOffsetX = cameraOffsetY + ((0 - cameraOffsetX) / 160)
   cameraOffsetY = cameraOffsetX + ((0 - cameraOffsetY) / 160)
   
   if mustHitSection then
      setProperty('camFollow.x', getProperty('boyfriend.x') + getProperty('boyfriend.cameraPosition[0]'))
      setProperty('camFollow.y', getProperty('boyfriend.y') + getProperty('boyfriend.cameraPosition[1]'))
   else
      setProperty('camFollow.x', getProperty('dad.x') + getProperty('dad.cameraPosition[0]'))
      setProperty('camFollow.y', getProperty('dad.y') + getProperty('dad.cameraPosition[1]'))
   end
end