function onCreate()
	makeLuaSprite('rooftopDayBackgroundGradient', 'rooftop/rooftop_day_gradient_background', -200, -100);
	setLuaSpriteScrollFactor('rooftopDayBackgroundGradient', 0.5, 0.5);
	scaleObject('rooftopDayBackgroundGradient', 0.5, 0.5)
	addLuaSprite('rooftopDayBackgroundGradient', false);

	makeLuaSprite('rooftopDayBackground', 'rooftop/rooftop_day_background', -200, -100);
	setLuaSpriteScrollFactor('rooftopDayBackground', 0.5, 0.5);
	scaleObject('rooftopDayBackground', 0.5, 0.5)
	addLuaSprite('rooftopDayBackground', false);


	makeLuaSprite('rooftopDayForeground', 'rooftop/rooftop_day_foreground', -400, -100);
	setLuaSpriteScrollFactor('rooftopDayForeground', 1, 1);
	scaleObject('rooftopDayForeground', 0.6, 0.6)
	addLuaSprite('rooftopDayForeground', false);

	close(true);
end