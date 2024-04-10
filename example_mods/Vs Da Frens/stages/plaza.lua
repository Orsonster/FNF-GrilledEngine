
--How makeLuaSprite works:
--makeLuaSprite(<SPRITE VARIABLE>, <SPRITE IMAGE FILE NAME>, <X>, <Y>);
--"Sprite Variable" is how you refer to the sprite you just spawned in other methods like "setScrollFactor" and "scaleObject" for example
function onCreate()
	-- background shit
	makeAnimatedLuaSprite('plazabg', 'Plaza_Animated', -1000, -500);
	addAnimationByPrefix('plazabg', 'plaza_animation', 'plaza-animation', 24, true)
	setScrollFactor('plazabg', 1.0, 1.0);


	addLuaSprite('plazabg', false);

	close(true); --Go ahead and close the script, we don't need it after the background is created
end