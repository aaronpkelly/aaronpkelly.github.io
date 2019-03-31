# ini tweaks
## disable intro videos
Make the following changes

_%USERPROFILE%\Documents\my games\borderlands\WillowGame\Config\WillowEngine.ini_:
```
[FullScreenMovie]
; StartupMovies=2K_logo
; StartupMovies=Gearbox_logo
; StartupMovies=NVidia
; StartupMovies=Loading
```

## disable video effects
```
Distortion=False
DetailMode=0
```

you can also disable the black borders (gain more performance, lose the style):
```
DefaultPostProcessName=WillowEngineMaterials.RyanScenePostProcess
```


# steam launch options
-DX9