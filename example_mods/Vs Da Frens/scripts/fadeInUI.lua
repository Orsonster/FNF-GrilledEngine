
function onCreate()
    doTweenAlpha(hudTween, "camHUD", 0, 0, "linear")
end
function onCreatePost()
    doTweenAlpha(hudTween, "camHUD", crochet, 1, "linear")
end