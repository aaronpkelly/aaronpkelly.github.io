# Sources
Great - https://www.reddit.com/r/lowspecgamer/comments/aoepyf/apex_legends_radical_custom_resolution_approach/
Good - https://www.reddit.com/r/lowspecgamer/comments/aoa77r/apex_legends_fps_boost_configs_launch_options/

# Configure launch options
Origin launcher -> My Game Library -> Right click -> Game properties -> Advanced launch properties
```
+exec autoexec -refresh 75 -dev -console -preload -threads 4 -forcenovsync -novid
```

# Create autoexec
Create this file:
c:\Program Files (x86)\Origin Games\Apex\cfg\autoexec.cfg

Add this:
```
fps_max 30
cl_forcepreload 1
mat_compressedtextures 1
cl_ragdoll_collide 0
```

# Edit video settings file
c:\Users\aaron\Saved Games\Respawn\Apex\local\videoconfig.txt

Ideally, don't chage these:
```
setting.defaultres
setting.defaultresheight
setting.stream_memory
```

Replace everything else with these:
```
"VideoConfig"
{
	"setting.cl_gib_allow"		"0"
	"setting.cl_particle_fallback_base"		"0"
	"setting.cl_particle_fallback_multiplier"		"0"
	"setting.cl_ragdoll_maxcount"		"0"
	"setting.cl_ragdoll_self_collision"		"0"
	"setting.mat_depthfeather_enable"		"0"
	"setting.mat_forceaniso"		"1"
	"setting.mat_mip_linear"		"0"
	"setting.stream_memory"		"0"
	"setting.mat_picmip"		"1"
	"setting.particle_cpu_level"		"0"
	"setting.r_createmodeldecals"		"0"
	"setting.r_decals"		"0"
	"setting.r_lod_switch_scale"		"0.35"
	"setting.shadow_enable"		"0"
	"setting.shadow_depth_dimen_min"		"0"
	"setting.shadow_depth_upres_factor_max"		"0"
	"setting.shadow_maxdynamic"		"0"
	"setting.ssao_enabled"		"0"
	"setting.ssao_downsample"		"3"
	"setting.modeldecals_forceAllowed"		"-1"
	"setting.dvs_enable"		"1"
	"setting.dvs_gpuframetime_min"		"1"
	"setting.dvs_gpuframetime_max"		"1"
	"setting.defaultres"		"1280"
	"setting.defaultresheight"		"720"
	"setting.fullscreen"		"0"
	"setting.nowindowborder"		"1"
	"setting.volumetric_lighting"		"0"
	"setting.mat_vsync_mode"		"0"
	"setting.mat_backbuffer_count"		"1"
	"setting.mat_antialias_mode"		"12"
	"setting.csm_enabled"		"0"
	"setting.csm_coverage"		"1"
	"setting.csm_cascade_res"		"512"
	"setting.fadeDistScale"		"1.000000"
	"setting.dvs_supersample_enable"		"0"
	"setting.gamma"		"1.000000"
	"setting.configversion"		"7"
}
```