function onCreate()
	makeLuaSprite('rooftopSunsetBackgroundGradient', 'rooftop/rooftop_sunset_gradient_background', -200, -100);
	setLuaSpriteScrollFactor('rooftopSunsetBackgroundGradient', 0.5, 0.5);
	scaleObject('rooftopSunsetBackgroundGradient', 0.5, 0.5)
	addLuaSprite('rooftopSunsetBackgroundGradient', false);

	makeLuaSprite('rooftopSunsetBackground', 'rooftop/rooftop_sunset_background', -200, -100);
	setLuaSpriteScrollFactor('rooftopSunsetBackground', 0.5, 0.5);
	scaleObject('rooftopSunsetBackground', 0.5, 0.5)
	addLuaSprite('rooftopSunsetBackground', false);


	makeLuaSprite('rooftopSunsetForeground', 'rooftop/rooftop_sunset_foreground', -400, -100);
	setLuaSpriteScrollFactor('rooftopSunsetForeground', 1, 1);
	scaleObject('rooftopSunsetForeground', 0.6, 0.6)
	addLuaSprite('rooftopSunsetForeground', false);

	close(true);
end