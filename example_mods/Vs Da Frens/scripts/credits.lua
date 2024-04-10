--NOTE: This is a modified version of the jukebox script, modified by Orsonster :D

--easy script configs
IntroTextSize = 15	--Size of the text for the Now Playing thing.
IntroSubTextSize = 15 --size of the text for the Song Name.
IntroTagColor = '8300c3'	--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
IntroBoxY = 20
BoxModifier = 0
BoxHeight = 0
--easy script configs

--actual script
function onCreate()
    
	--the tag at the end of the box
    if songName == "Bass-lit-breeze" then
		BoxHeight = 50
	end
	if songName == "Electro-Bass-Remastered" then
		IntroSubTextSize = 11
	end
	makeLuaSprite('JukeBoxTag', 'empty', -IntroTagWidth, 0)
	makeGraphic('JukeBoxTag', IntroTagWidth+BoxModifier, 100 + BoxHeight, IntroTagColor)
    setProperty('JukeBoxTag.alpha', tonumber(1.0))
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 0)
	makeGraphic('JukeBox', 300+BoxModifier, 100 + BoxHeight, '000000')
	setObjectCamera('JukeBox', 'other')
    setProperty('JukeBox.alpha', tonumber(0.6))
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 300+BoxModifier, -305-IntroTagWidth-BoxModifier, 15)
	setTextAlignment('JukeBoxText', 'Left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songName, 300, -305-IntroTagWidth-BoxModifier, 35)
	setTextAlignment('JukeBoxSubText', 'Left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')

    --the funny spinning disc
    makeLuaSprite('JukeBoxDisc', 'Disc', -305-IntroTagWidth, 10)
    scaleObject('JukeBoxDisc', 0.12, 0.12)
    setObjectCamera('JukeBoxDisc', 'other')
	addLuaSprite('JukeBoxDisc', true)

    --the funny song name display number 2
    makeLuaText('AlwaysOnDisplay', 'Now Playing: '.. songName, 400, 50, 650)
    setTextAlignment('AlwaysOnDisplay', 'Left')
    setObjectCamera('AlwaysOnDisplay', 'other')
	setTextSize('AlwaysOnDisplay', IntroSubTextSize)
	addLuaText('AlwaysOnDisplay')

	--the divider
    
	makeLuaSprite('JukeBoxDivider', 'empty', -305, 10)
	makeGraphic('JukeBoxDivider', 2, 80 + BoxHeight, 'ffffff')
	setObjectCamera('JukeBoxDivider', 'other')
	addLuaSprite('JukeBoxDivider', true)

	--the song credits will have to be softcoded. unless I find a way to embed this data into the song chart.

	if songName == "Untitled-0" then
		makeLuaText('JukeBoxCredits', songName.. ' was charted and composed by @Orsonster', 180, -300, 60)
		setTextAlignment('JukeBoxCredits', 'Left')
		setObjectCamera('JukeBoxCredits', 'other')
		setTextSize('JukeBoxCredits', IntroSubTextSize * 0.8)
		addLuaText('JukeBoxCredits')
	end
	if songName == "Skyline-Remastered" then
		makeLuaText('JukeBoxCredits', songName.. ' was charted and remastered by @Orsonster', 180, -300, 60)
		setTextAlignment('JukeBoxCredits', 'Left')
		setObjectCamera('JukeBoxCredits', 'other')
		setTextSize('JukeBoxCredits', IntroSubTextSize * 0.8)
		addLuaText('JukeBoxCredits')
	end
	if songName == "Classical-Remastered" then
		makeLuaText('JukeBoxCredits', songName.. ' was charted and remastered by @Orsonster', 180, -300, 60)
		setTextAlignment('JukeBoxCredits', 'Left')
		setObjectCamera('JukeBoxCredits', 'other')
		setTextSize('JukeBoxCredits', IntroSubTextSize * 0.8)
		addLuaText('JukeBoxCredits')
	end
	if songName == "Bass-lit-breeze" then
		makeLuaText('JukeBoxCredits', songName.. ' was charted and composed by @Orsonster, thanks to Thanks to Tomas Eriksson on one motion chord player', 180, -300, 60)
		setTextAlignment('JukeBoxCredits', 'Left')
		setObjectCamera('JukeBoxCredits', 'other')
		setTextSize('JukeBoxCredits', IntroSubTextSize * 0.8)
		addLuaText('JukeBoxCredits')
	end
    if songName == "Electro-Bass-Remastered" then
		makeLuaText('JukeBoxCredits', songName.. ' was charted and composed by @Orsonster', 180, -300, 60)
		setTextAlignment('JukeBoxCredits', 'Left')
		setObjectCamera('JukeBoxCredits', 'other')
		setTextSize('JukeBoxCredits', IntroSubTextSize * 0.8)
		addLuaText('JukeBoxCredits')
	end
end

--motion functions
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxTag', 300, 2, 'ExpoOut')
	doTweenX('MoveInTwo', 'JukeBox', 0, 2, 'ExpoOut')
	doTweenX('MoveInThree', 'JukeBoxText', 120, 2, 'ExpoOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 120, 2, 'ExpoOut')
	doTweenX('MoveInFive', 'JukeBoxDisc', 10, 2, 'ExpoOut')
	doTweenX('MoveInSix', 'JukeBoxDivider', 100, 2, 'ExpoOut')
	doTweenX('MoveInSeven', 'JukeBoxCredits', 120, 2, 'ExpoOut')
    doTweenAngle('SpinDisc', 'JukeBoxDisc', 100000, 12, 'ExpoIn')
	runTimer('JukeBoxWait', 5, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -150, 1.5, 'ExpoIn')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'ExpoIn')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'ExpoIn')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'ExpoIn')
        doTweenX('MoveOutFive', 'JukeBoxDisc', -450, 1.5, 'ExpoIn')
		doTweenX('MoveOutSix', 'JukeBoxDivider', -450, 1.5, 'ExpoIn')
		doTweenX('MoveOutSeven', 'JukeBoxCredits', -450, 1.5, 'ExpoIn')
	end
end