function onEvent(eventName, zoomFactor, zoomDuration)
    if eventName == 'cameraZoomEvent' then
        doTweenZoom('tweenCameraZoom', 'camGame', zoomFactor, zoomDuration, 'smoothStepInOut')
    end
end 