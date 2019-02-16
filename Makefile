# To compile withaudio, WITHAUDIO=yes,
# for no audio support, change to WITHAUDIO=no,
WITHAUDIO=yes
# WITHAUDIO=no

# use "make OSX=1" for mac
OSX=0

# -lrt is only needed for clock_gettime() and only for glibc before 2.17
# LRTLIB=-lrt
LRTLIB=

INSTALL ?= install
AWK ?= awk

# Type "make O=0" to get a debug build (-g)
# "make O=1" gets an optimized (-O3) build with no debug info, which is the default
# optimize/debug (-O3, -g: default 1=yes/no, 2=no/yes)
O ?= 1

# Type "make P=1" to get a build with profiling information for use with
# gprof. This is turned off by default
# profile (default 0=no, 1=yes)
P ?= 0

# Type "make V=1" to get a verbose build with all commands printed
# By default, this is turned off.
# verbose (default 0=no, 1=yes)
V ?= 0

CC ?= gcc

DESTDIR=.
PREFIX?=.

DATADIR=${DESTDIR}/${PREFIX}/share/snis
CONFIGFILEDIR=${DATADIR}
CONFIGSRCDIR=./share/snis
CONFIGFILES=${CONFIGSRCDIR}/commodities.txt \
	${CONFIGSRCDIR}/factions.txt \
	${CONFIGSRCDIR}/ship_types.txt \
	${CONFIGSRCDIR}/starbase_models.txt \
	${CONFIGSRCDIR}/user_colors.cfg \
	${CONFIGSRCDIR}/joystick_config.txt
SOLARSYSTEMSRCDIR=${CONFIGSRCDIR}/solarsystems
SOLARSYSTEMDIR=${DATADIR}/solarsystems
SOLARSYSTEMFILES=${SOLARSYSTEMSRCDIR}/default/assets.txt

ASSETSSRCDIR=share/snis

MODELSRCDIR=${ASSETSSRCDIR}/models
MODELDIR=${DATADIR}/models
SOUNDDIR=${DATADIR}/sounds
SOUNDSRCDIR=${ASSETSSRCDIR}/sounds
SOUNDFILES=${SOUNDSRCDIR}/Attribution.txt \
	${SOUNDSRCDIR}/atmospheric-friction.ogg \
	${SOUNDSRCDIR}/big_explosion.ogg \
	${SOUNDSRCDIR}/bigshotlaser.ogg \
	${SOUNDSRCDIR}/changescreen.ogg \
	${SOUNDSRCDIR}/comms-hail.ogg \
	${SOUNDSRCDIR}/crewmember-has-joined.ogg \
	${SOUNDSRCDIR}/dangerous-radiation.ogg \
	${SOUNDSRCDIR}/docking-sound.ogg \
	${SOUNDSRCDIR}/docking-system-disengaged.ogg \
	${SOUNDSRCDIR}/docking-system-engaged.ogg \
	${SOUNDSRCDIR}/entering-high-security-area.ogg \
	${SOUNDSRCDIR}/flak_gun_sound.ogg \
	${SOUNDSRCDIR}/flak_hit.ogg \
	${SOUNDSRCDIR}/fuel-levels-critical.ogg \
	${SOUNDSRCDIR}/incoming-fire-detected.ogg \
	${SOUNDSRCDIR}/laser-fail.ogg \
	${SOUNDSRCDIR}/leaving-high-security-area.ogg \
	${SOUNDSRCDIR}/mining-bot-deployed.ogg \
	${SOUNDSRCDIR}/mining-bot-standing-by.ogg \
	${SOUNDSRCDIR}/mining-bot-stowed.ogg \
	${SOUNDSRCDIR}/new-starship.ogg \
	${SOUNDSRCDIR}/offscreen.ogg \
	${SOUNDSRCDIR}/onscreen.ogg \
	${SOUNDSRCDIR}/permission-to-dock-denied.ogg \
	${SOUNDSRCDIR}/permission-to-dock-has-expired.ogg \
	${SOUNDSRCDIR}/permission-to-dock-granted.ogg \
	${SOUNDSRCDIR}/proximity-alert.ogg \
	${SOUNDSRCDIR}/red-alert.ogg \
	${SOUNDSRCDIR}/reverse.ogg \
	${SOUNDSRCDIR}/robot-insert-component.ogg \
	${SOUNDSRCDIR}/robot-remove-component.ogg \
	${SOUNDSRCDIR}/science-data-acquired.ogg \
	${SOUNDSRCDIR}/science-probe.ogg \
	${SOUNDSRCDIR}/short-warpdrive.ogg \
	${SOUNDSRCDIR}/slider-noise.ogg \
	${SOUNDSRCDIR}/spaceship-crash.ogg \
	${SOUNDSRCDIR}/torpedo-loading.ogg \
	${SOUNDSRCDIR}/transporter-sound.ogg \
	${SOUNDSRCDIR}/tty-chatter.ogg \
	${SOUNDSRCDIR}/warning-hull-breach-imminent.ogg \
	${SOUNDSRCDIR}/warp-drive-fumble.ogg \
	${SOUNDSRCDIR}/warpdrive.ogg \
	${SOUNDSRCDIR}/welcome-to-starbase.ogg \
	${SOUNDSRCDIR}/hull-creak-0.ogg \
	${SOUNDSRCDIR}/hull-creak-1.ogg \
	${SOUNDSRCDIR}/hull-creak-2.ogg \
	${SOUNDSRCDIR}/hull-creak-3.ogg \
	${SOUNDSRCDIR}/hull-creak-4.ogg \
	${SOUNDSRCDIR}/hull-creak-5.ogg \
	${SOUNDSRCDIR}/hull-creak-6.ogg \
	${SOUNDSRCDIR}/hull-creak-7.ogg \
	${SOUNDSRCDIR}/hull-creak-8.ogg \
	${SOUNDSRCDIR}/hull-creak-9.ogg \
	${SOUNDSRCDIR}/ui1.ogg \
	${SOUNDSRCDIR}/ui2.ogg \
	${SOUNDSRCDIR}/ui3.ogg \
	${SOUNDSRCDIR}/ui4.ogg \
	${SOUNDSRCDIR}/ui5.ogg \
	${SOUNDSRCDIR}/ui6.ogg \
	${SOUNDSRCDIR}/ui7.ogg \
	${SOUNDSRCDIR}/ui8.ogg \
	${SOUNDSRCDIR}/ui9.ogg \
	${SOUNDSRCDIR}/ui10.ogg \
	${SOUNDSRCDIR}/ui11.ogg \
	${SOUNDSRCDIR}/ui12.ogg \
	${SOUNDSRCDIR}/ui13.ogg \
	${SOUNDSRCDIR}/ui14.ogg \
	${SOUNDSRCDIR}/ui15.ogg \
	${SOUNDSRCDIR}/ui16.ogg \
	${SOUNDSRCDIR}/ui17.ogg \
	${SOUNDSRCDIR}/ui18.ogg \
	${SOUNDSRCDIR}/ui19.ogg \
	${SOUNDSRCDIR}/ui20.ogg \
	${SOUNDSRCDIR}/ui21.ogg \
	${SOUNDSRCDIR}/ui22.ogg \
	${SOUNDSRCDIR}/ui23.ogg \
	${SOUNDSRCDIR}/ui24.ogg \
	${SOUNDSRCDIR}/ui25.ogg \
	${SOUNDSRCDIR}/ui26.ogg \
	${SOUNDSRCDIR}/ui27.ogg \
	${SOUNDSRCDIR}/ui28.ogg \
	${SOUNDSRCDIR}/ui29.ogg \
	${SOUNDSRCDIR}/spacemonster_slap.ogg \
	${SOUNDSRCDIR}/alarm_buzzer.ogg \
	${SOUNDSRCDIR}/atlas_rocket_sample.ogg \
	${SOUNDSRCDIR}/maneuvering_thruster.ogg \
	${SOUNDSRCDIR}/missile_launch.ogg

TEXTUREDIR=${DATADIR}/textures
TEXTURESRCDIR=${ASSETSSRCDIR}/textures
TEXTUREFILES=${TEXTURESRCDIR}/AreaTex.h \
	${TEXTURESRCDIR}/asteroid1-0.png \
	${TEXTURESRCDIR}/asteroid1-1.png \
	${TEXTURESRCDIR}/asteroid1-2.png \
	${TEXTURESRCDIR}/asteroid1-3.png \
	${TEXTURESRCDIR}/asteroid1-4.png \
	${TEXTURESRCDIR}/asteroid1-5.png \
	${TEXTURESRCDIR}/asteroid2-0.png \
	${TEXTURESRCDIR}/asteroid2-1.png \
	${TEXTURESRCDIR}/asteroid2-2.png \
	${TEXTURESRCDIR}/asteroid2-3.png \
	${TEXTURESRCDIR}/asteroid2-4.png \
	${TEXTURESRCDIR}/asteroid2-5.png \
	${TEXTURESRCDIR}/Attribution.txt \
	${TEXTURESRCDIR}/green-laser-texture.png \
	${TEXTURESRCDIR}/image0.png \
	${TEXTURESRCDIR}/image1.png \
	${TEXTURESRCDIR}/image2.png \
	${TEXTURESRCDIR}/image3.png \
	${TEXTURESRCDIR}/image4.png \
	${TEXTURESRCDIR}/image5.png \
	${TEXTURESRCDIR}/nebula0.png \
	${TEXTURESRCDIR}/nebula1.png \
	${TEXTURESRCDIR}/nebula2.png \
	${TEXTURESRCDIR}/nebula3.png \
	${TEXTURESRCDIR}/nebula4.png \
	${TEXTURESRCDIR}/nebula5.png \
	${TEXTURESRCDIR}/orange-haze0.png \
	${TEXTURESRCDIR}/orange-haze1.png \
	${TEXTURESRCDIR}/orange-haze2.png \
	${TEXTURESRCDIR}/orange-haze3.png \
	${TEXTURESRCDIR}/orange-haze4.png \
	${TEXTURESRCDIR}/orange-haze5.png \
	${TEXTURESRCDIR}/planetary-ring0.png \
	${TEXTURESRCDIR}/planetary-ring1.png \
	${TEXTURESRCDIR}/planet-texture0-0.png \
	${TEXTURESRCDIR}/planet-texture0-1.png \
	${TEXTURESRCDIR}/planet-texture0-2.png \
	${TEXTURESRCDIR}/planet-texture0-3.png \
	${TEXTURESRCDIR}/planet-texture0-4.png \
	${TEXTURESRCDIR}/planet-texture0-5.png \
	${TEXTURESRCDIR}/planet-texture0.png \
	${TEXTURESRCDIR}/planet-texture1-0.png \
	${TEXTURESRCDIR}/planet-texture1-1.png \
	${TEXTURESRCDIR}/planet-texture1-2.png \
	${TEXTURESRCDIR}/planet-texture1-3.png \
	${TEXTURESRCDIR}/planet-texture1-4.png \
	${TEXTURESRCDIR}/planet-texture1-5.png \
	${TEXTURESRCDIR}/planet-texture1.png \
	${TEXTURESRCDIR}/planet-texture2-0.png \
	${TEXTURESRCDIR}/planet-texture2-1.png \
	${TEXTURESRCDIR}/planet-texture2-2.png \
	${TEXTURESRCDIR}/planet-texture2-3.png \
	${TEXTURESRCDIR}/planet-texture2-4.png \
	${TEXTURESRCDIR}/planet-texture2-5.png \
	${TEXTURESRCDIR}/planet-texture2.png \
	${TEXTURESRCDIR}/planet-texture3-0.png \
	${TEXTURESRCDIR}/planet-texture3-1.png \
	${TEXTURESRCDIR}/planet-texture3-2.png \
	${TEXTURESRCDIR}/planet-texture3-3.png \
	${TEXTURESRCDIR}/planet-texture3-4.png \
	${TEXTURESRCDIR}/planet-texture3-5.png \
	${TEXTURESRCDIR}/planet-texture3.png \
	${TEXTURESRCDIR}/planet-texture4-0.png \
	${TEXTURESRCDIR}/planet-texture4-1.png \
	${TEXTURESRCDIR}/planet-texture4-2.png \
	${TEXTURESRCDIR}/planet-texture4-3.png \
	${TEXTURESRCDIR}/planet-texture4-4.png \
	${TEXTURESRCDIR}/planet-texture4-5.png \
	${TEXTURESRCDIR}/red-laser-texture.png \
	${TEXTURESRCDIR}/red-torpedo-texture.png \
	${TEXTURESRCDIR}/SearchTex.h \
	${TEXTURESRCDIR}/shield-effect-0.png \
	${TEXTURESRCDIR}/shield-effect-1.png \
	${TEXTURESRCDIR}/shield-effect-2.png \
	${TEXTURESRCDIR}/shield-effect-3.png \
	${TEXTURESRCDIR}/shield-effect-4.png \
	${TEXTURESRCDIR}/shield-effect-5.png \
	${TEXTURESRCDIR}/space-blue-plasma.png \
	${TEXTURESRCDIR}/spark-texture.png \
	${TEXTURESRCDIR}/sun.png \
	${TEXTURESRCDIR}/test0.png \
	${TEXTURESRCDIR}/test1.png \
	${TEXTURESRCDIR}/test2.png \
	${TEXTURESRCDIR}/test3.png \
	${TEXTURESRCDIR}/test4.png \
	${TEXTURESRCDIR}/test5.png \
	${TEXTURESRCDIR}/thrust.png \
	${TEXTURESRCDIR}/warp-effect.png \
	${TEXTURESRCDIR}/warp-tunnel.png \
	${TEXTURESRCDIR}/wormhole.png \
	${TEXTURESRCDIR}/green-burst.png \
	${TEXTURESRCDIR}/blue-tractor-texture.png \
	${TEXTURESRCDIR}/missile_texture.png \
	${TEXTURESRCDIR}/black_hole.png \
	${TEXTURESRCDIR}/docking_port_emit.png \
	${TEXTURESRCDIR}/docking_port_texture.png \
	${TEXTURESRCDIR}/green-spark.png \
	${TEXTURESRCDIR}/laserflash.png \
	${TEXTURESRCDIR}/spacemonster_emit.png \
	${TEXTURESRCDIR}/spacemonster_tentacle_emit.png \
	${TEXTURESRCDIR}/spacemonster_tentacle_texture.png \
	${TEXTURESRCDIR}/spacemonster_texture.png \
	${TEXTURESRCDIR}/spaceplate.png \
	${TEXTURESRCDIR}/spaceplate_small.png \
	${TEXTURESRCDIR}/spaceplate_small_emit.png \
	${TEXTURESRCDIR}/spaceplateemit.png \
	${TEXTURESRCDIR}/thrust_flare.png \
	${TEXTURESRCDIR}/thrustblue.png \
	${TEXTURESRCDIR}/thrustgreen.png \
	${TEXTURESRCDIR}/thrustred.png \
	${TEXTURESRCDIR}/thrustviolet.png \
	${TEXTURESRCDIR}/thrustyellow.png \
	${TEXTURESRCDIR}/warpgate_emit.png \
	${TEXTURESRCDIR}/warpgate_texture.png

LUASCRIPTDIR=${DATADIR}/luascripts
LUASRCDIR=${ASSETSSRCDIR}/luascripts
LUASCRIPTS=${LUASRCDIR}/CLEAR_ALL.LUA \
	${LUASRCDIR}/COLLISION.LUA \
	${LUASRCDIR}/HELLO.LUA \
	${LUASRCDIR}/initialize.lua \
	${LUASRCDIR}/SILLY-SPACE-BATTLE.LUA \
	${LUASRCDIR}/TRAINING-MISSION-1.LUA \
	${LUASRCDIR}/TRAINING-MISSION-2.LUA \
	${LUASRCDIR}/BIGSHIP.LUA \
	${LUASRCDIR}/CARGO.LUA \
	${LUASRCDIR}/DAMAGE.LUA \
	${LUASRCDIR}/DEMOLISHER.LUA \
	${LUASRCDIR}/DISABLE_ANTENNA.LUA \
	${LUASRCDIR}/ENABLE_ANTENNA.LUA \
	${LUASRCDIR}/KALI.LUA \
	${LUASRCDIR}/MAINMENU.LUA \
	${LUASRCDIR}/PLAYER_SPEED_BOOST.LUA \
	${LUASRCDIR}/PLAYER_SPEED_DEFAULT.LUA \
	${LUASRCDIR}/REGENERATE.LUA \
	${LUASRCDIR}/RESETBRIDGE.LUA \
	${LUASRCDIR}/RESTORE_SKYBOX.LUA \
	${LUASRCDIR}/SAVING-PLANET-ERPH.LUA \
	${LUASRCDIR}/SAY.LUA \
	${LUASRCDIR}/SPACEPOX.LUA

MATERIALDIR=${DATADIR}/materials
MATERIALSRCDIR=${ASSETSSRCDIR}/materials
MATERIALFILES=${MATERIALSRCDIR}/nebula0.mat \
	${MATERIALSRCDIR}/nebula10.mat \
	${MATERIALSRCDIR}/nebula11.mat \
	${MATERIALSRCDIR}/nebula12.mat \
	${MATERIALSRCDIR}/nebula13.mat \
	${MATERIALSRCDIR}/nebula14.mat \
	${MATERIALSRCDIR}/nebula15.mat \
	${MATERIALSRCDIR}/nebula16.mat \
	${MATERIALSRCDIR}/nebula17.mat \
	${MATERIALSRCDIR}/nebula18.mat \
	${MATERIALSRCDIR}/nebula19.mat \
	${MATERIALSRCDIR}/nebula1.mat \
	${MATERIALSRCDIR}/nebula2.mat \
	${MATERIALSRCDIR}/nebula3.mat \
	${MATERIALSRCDIR}/nebula4.mat \
	${MATERIALSRCDIR}/nebula5.mat \
	${MATERIALSRCDIR}/nebula6.mat \
	${MATERIALSRCDIR}/nebula7.mat \
	${MATERIALSRCDIR}/nebula8.mat \
	${MATERIALSRCDIR}/nebula9.mat

SHADERDIR=${DESTDIR}/${PREFIX}/share/snis/shader
SHADERSRCDIR=${ASSETSSRCDIR}/shader
SHADERS=${SHADERSRCDIR}/atmosphere.frag \
	${SHADERSRCDIR}/atmosphere.vert \
	${SHADERSRCDIR}/color_by_w.frag \
	${SHADERSRCDIR}/color_by_w.vert \
	${SHADERSRCDIR}/fs-effect-copy.shader \
	${SHADERSRCDIR}/line-single-color.frag \
	${SHADERSRCDIR}/line-single-color.vert \
	${SHADERSRCDIR}/per_vertex_color.frag \
	${SHADERSRCDIR}/per_vertex_color.vert \
	${SHADERSRCDIR}/point_cloud.frag \
	${SHADERSRCDIR}/point_cloud-intensity-noise.frag \
	${SHADERSRCDIR}/point_cloud-intensity-noise.vert \
	${SHADERSRCDIR}/point_cloud.vert \
	${SHADERSRCDIR}/single_color.frag \
	${SHADERSRCDIR}/single-color-lit-per-pixel.frag \
	${SHADERSRCDIR}/single-color-lit-per-pixel.vert \
	${SHADERSRCDIR}/single-color-lit-per-vertex.frag \
	${SHADERSRCDIR}/single-color-lit-per-vertex.vert \
	${SHADERSRCDIR}/single_color.vert \
	${SHADERSRCDIR}/skybox.frag \
	${SHADERSRCDIR}/skybox.vert \
	${SHADERSRCDIR}/smaa-blend.shader \
	${SHADERSRCDIR}/smaa-edge.shader \
	${SHADERSRCDIR}/smaa-high.shader \
	${SHADERSRCDIR}/SMAA.hlsl \
	${SHADERSRCDIR}/smaa-neighborhood.shader \
	${SHADERSRCDIR}/textured-and-lit-per-pixel.shader \
	${SHADERSRCDIR}/textured-and-lit-per-vertex.shader \
	${SHADERSRCDIR}/textured-cubemap-and-lit-per-pixel.shader \
	${SHADERSRCDIR}/textured-cubemap-and-lit-per-vertex.shader \
	${SHADERSRCDIR}/textured-cubemap-shield-per-pixel.shader \
	${SHADERSRCDIR}/textured-cubemap-and-lit-with-annulus-shadow-per-pixel.shader \
	${SHADERSRCDIR}/textured-particle.frag \
	${SHADERSRCDIR}/textured-particle.vert \
	${SHADERSRCDIR}/textured.shader \
	${SHADERSRCDIR}/textured-with-sphere-shadow-per-pixel.shader \
	${SHADERSRCDIR}/wireframe_filled.frag \
	${SHADERSRCDIR}/wireframe_filled.vert \
	${SHADERSRCDIR}/wireframe_transparent.frag \
	${SHADERSRCDIR}/wireframe-transparent-sphere-clip.frag \
	${SHADERSRCDIR}/wireframe-transparent-sphere-clip.vert \
	${SHADERSRCDIR}/wireframe_transparent.vert \
	${SHADERSRCDIR}/alpha_by_normal.shader

SCAD_PARAMS_FILES=${MODELSRCDIR}/disruptor.scad_params.h \
	${MODELSRCDIR}/enforcer.scad_params.h \
	${MODELSRCDIR}/starbase5.scad_params.h \
	${MODELSRCDIR}/research-vessel.scad_params.h \
	${MODELSRCDIR}/conqueror.scad_params.h \
	${MODELSRCDIR}/cruiser.scad_params.h \
	${MODELSRCDIR}/asteroid-miner.scad_params.h \
	${MODELSRCDIR}/battlestar.scad_params.h \
	${MODELSRCDIR}/wombat.scad_params.h \
	${MODELSRCDIR}/destroyer.scad_params.h \
	${MODELSRCDIR}/dragonhawk.scad_params.h \
	${MODELSRCDIR}/tanker.scad_params.h \
	${MODELSRCDIR}/swordfish.scad_params.h \
	${MODELSRCDIR}/vanquisher.scad_params.h \
	${MODELSRCDIR}/freighter.scad_params.h \
	${MODELSRCDIR}/scrambler.scad_params.h \
	${MODELSRCDIR}/spaceship2.scad_params.h \
	${MODELSRCDIR}/spaceship3.scad_params.h \
	${MODELSRCDIR}/skorpio.scad_params.h \
	${MODELSRCDIR}/spaceship.scad_params.h \
	${MODELSRCDIR}/transport.scad_params.h \
	${MODELSRCDIR}/escapepod.scad_params.h \
	${MODELSRCDIR}/mantis.scad_params.h \
	${MODELSRCDIR}/missile.scad_params.h

DOCKING_PORT_FILES=${MODELSRCDIR}/starbase2.docking_ports.h \
	${MODELSRCDIR}/starbase3.docking_ports.h \
	${MODELSRCDIR}/starbase4.docking_ports.h \
	${MODELSRCDIR}/starbase5.docking_ports.h \
	${MODELSRCDIR}/starbase6.docking_ports.h \
	${MODELSRCDIR}/starbase.docking_ports.h

MANSRCDIR=.
MANPAGES=${MANSRCDIR}/snis_client.6.gz ${MANSRCDIR}/snis_server.6.gz \
	${MANSRCDIR}/earthlike.1.gz \
	${MANSRCDIR}/snis_text_to_speech.sh.6 ${MANSRCDIR}/snis_test_audio.1.gz ssgl/ssgl_server.6 snis_multiverse.6
MANDIR=${DESTDIR}/${PREFIX}/share/man/man6

DESKTOPDIR=${DESTDIR}/${PREFIX}/share/applications
DESKTOPSRCDIR=.
DESKTOPFILES=${DESKTOPSRCDIR}/snis.desktop
UPDATE_DESKTOP=update-desktop-database ${DESKTOPDIR} || :

# -rdynamic is used by gcc for runtime stack traces (see stacktrace.c)
# but clang complains about it.
ifeq (${CC},clang)
RDYNAMIC=
else
RDYNAMIC=-rdynamic
endif

ifeq (${WITHAUDIO},yes)
SNDLIBS:=$(shell pkg-config --libs portaudio-2.0 vorbisfile)
SNDFLAGS:=-DWITHAUDIOSUPPORT $(shell pkg-config --cflags portaudio-2.0) -DDATADIR=\"${DATADIR}\"
OGGOBJ=ogg_to_pcm.o
SNDOBJS=wwviaudio.o
else
SNDLIBS=
SNDFLAGS=-DWWVIAUDIO_STUBS_ONLY
OGGOBJ=
SNDOBJS=wwviaudio.o
endif

ifeq (${E},1)
STOP_ON_WARN=-Werror
else
STOP_ON_WARN=
endif

ifeq (${O},1)
DEBUGFLAG=
OPTIMIZEFLAG=-O3
else
DEBUGFLAG=-g
OPTIMIZEFLAG=
endif

ifeq (${P},1)
PROFILEFLAG=-pg
OPTIMIZEFLAG=-O3
DEBUGFLAG=
else
PROFILEFLAG=
endif

ifeq (${OSX},0)
# Arch pkg-config seems to be broken for lua5.2, so we have
# this "... || echo" hack thing.
#
LUALIBS:=$(shell pkg-config --libs lua5.2 --silence-errors || pkg-config --libs lua52 --silence-errors || pkg-config --libs lua --silence-errors || echo '-llua5.2')
LUACFLAGS:=$(shell pkg-config --cflags lua5.2 --silence-errors || pkg-config --cflags lua52 --silence-errors || pkg-config --cflags lua --silence-errors || echo '')
else
# OSX needs to do it this way (what is the point of pkgconfig if they all do it differently?)
LUALIBS:=$(shell pkg-config --libs lua)
LUACFLAGS:=$(shell pkg-config --cflags lua)
endif

PNGLIBS:=$(shell pkg-config --libs libpng)
PNGCFLAGS:=$(shell pkg-config --cflags libpng)

SDLLIBS:=$(shell pkg-config sdl --libs)
SDLCFLAGS:=$(shell pkg-config sdl --cflags)

GLEWLIBS:=$(shell pkg-config --libs-only-l glew)
GLEWCFLAGS:=$(shell pkg-config --cflags glew)

COMMONOBJS=mathutils.o snis_alloc.o snis_socket_io.o snis_marshal.o \
		bline.o shield_strength.o stacktrace.o snis_ship_type.o \
		snis_faction.o mtwist.o names.o infinite-taunt.o snis_damcon_systems.o \
		string-utils.o c-is-the-locale.o starbase_metadata.o arbitrary_spin.o \
		planetary_atmosphere.o mesh.o mikktspace/mikktspace.o pthread_util.o \
		snis_opcode_def.o rts_unit_data.o commodities.o snis_tweak.o rootcheck.o \
		corporations.o replacement_assets.o snis_asset_dir.o
SERVEROBJS=${COMMONOBJS} snis_server.o starbase-comms.o \
		power-model.o quat.o vec4.o matrix.o snis_event_callback.o space-part.o fleet.o \
		docking_port.o elastic_collision.o snis_nl.o spelled_numbers.o \
		snis_server_tracker.o snis_bridge_update_packet.o solarsystem_config.o a_star.o \
		key_value_parser.o nonuniform_random_sampler.o oriented_bounding_box.o \
		graph_dev_mesh_stub.o turret_aimer.o snis_hash.o snis_server_debug.o \
		ship_registration.o
MULTIVERSEOBJS=snis_multiverse.o snis_marshal.o snis_socket_io.o mathutils.o mtwist.o stacktrace.o \
		snis_hash.o quat.o string-utils.o key_value_parser.o snis_bridge_update_packet.o \
		pthread_util.o rootcheck.o starmap_adjacency.o replacement_assets.o snis_asset_dir.o

COMMONCLIENTOBJS=${COMMONOBJS} ${OGGOBJ} ${SNDOBJS} snis_ui_element.o snis_font.o snis_text_input.o \
	snis_typeface.o snis_gauge.o snis_button.o snis_label.o snis_sliders.o snis_text_window.o \
	snis_strip_chart.o material.o stl_parser.o entity.o matrix.o my_point.o liang-barsky.o joystick.o \
	quat.o vec4.o thrust_attachment.o docking_port.o ui_colors.o snis_keyboard.o solarsystem_config.o \
	pronunciation.o snis_preferences.o snis_pull_down_menu.o snis_client_debug.o starmap_adjacency.o

CLIENTOBJS=${COMMONCLIENTOBJS} shader.o graph_dev_opengl.o opengl_cap.o snis_graph.o snis_client.o joystick_config.o

LIMCLIENTOBJS=${COMMONCLIENTOBJS} graph_dev_gdk.o snis_limited_graph.o snis_limited_client.o joystick_config.o

SDLCLIENTOBJS=shader.o graph_dev_opengl.o opengl_cap.o snis_graph.o mesh_viewer.o \
				png_utils.o turret_aimer.o quat.o mathutils.o mesh.o mikktspace/mikktspace.o \
				mtwist.o material.o entity.o snis_alloc.o matrix.o stacktrace.o stl_parser.o \
				snis_typeface.o snis_font.o string-utils.o ui_colors.o liang-barsky.o \
				bline.o vec4.o
NEBULANOISEOBJS=nebula_noise.o open-simplex-noise.o png_utils.o
NEBULANOISELIBS=-lm ${PNGLIBS}

GENERATE_SKYBOX_OBJS=generate_skybox.o open-simplex-noise.o png_utils.o mathutils.o quat.o mtwist.o
GENERATE_SKYBOX_LIBS=-lm ${PNGLIBS}

SSGL=ssgl/libssglclient.a
LIBS=-lGL -Lssgl -lssglclient -ldl -lm ${LUALIBS} ${PNGLIBS} ${GLEWLIBS} -lcrypt
SERVERLIBS=-Lssgl -lssglclient ${LRTLIB} -ldl -lm ${LUALIBS} -lcrypt
MULTIVERSELIBS=-Lssgl -lssglclient ${LRTLIB} -ldl -lm
MULTIVERSELIBS=-Lssgl -lssglclient ${LRTLIB} -ldl -lm -lcrypt
#
# NOTE: if you get
#
# /usr/bin/ld: cannot find -llua5.2
# collect2: ld returned 1 exit status
#
# try:
#
# sudo ln -s /usr/lib/i386-linux-gnu/liblua5.1.so.0 /usr/local/lib/liblua5.2.so
#
# or, if on x86_64:
#
# sudo ln -s /usr/lib/x86_64-linux-gnu/liblua5.1.so.0 /usr/local/lib/liblua5.2.so
#
# Also, you will need to install lua5.2 and liblua5.2-dev
# "sudo apt-get install liblua5.2-dev lua5.2"
#


PROGS=snis_server snis_client snis_limited_client snis_multiverse
BINPROGS=bin/ssgl_server bin/snis_server bin/snis_client bin/snis_limited_client bin/snis_text_to_speech.sh \
		bin/snis_multiverse bin/lsssgl
UTILPROGS=util/mask_clouds util/cloud-mask-normalmap mesh_viewer util/sample_image_colors \
		util/generate_solarsystem_positions nebula_noise generate_skybox
ESSENTIAL_SCRIPTS=snis_text_to_speech.sh

# model directory
MD=${ASSETSSRCDIR}/models

MODELS=${MD}/freighter.stl \
	${MD}/laser.stl \
	${MD}/spaceship.stl \
	${MD}/torpedo.stl \
	${MD}/tanker.stl \
	${MD}/destroyer.stl \
	${MD}/transport.stl \
	${MD}/battlestar.stl \
	${MD}/cruiser.stl \
	${MD}/tetrahedron.stl \
	${MD}/flat-tetrahedron.stl \
	${MD}/big-flat-tetrahedron.stl \
	${MD}/asteroid.stl \
	${MD}/asteroid2.stl \
	${MD}/asteroid3.stl \
	${MD}/asteroid4.stl \
	${MD}/wormhole.stl \
	${MD}/starbase3.stl \
	${MD}/starbase4.stl \
	${MD}/starbase5.stl \
	${MD}/starbase6.stl \
	${MD}/spacemonster.stl \
	${MD}/asteroid-miner.stl \
	${MD}/spaceship2.stl \
	${MD}/spaceship3.stl \
	${MD}/dragonhawk.stl \
	${MD}/skorpio.stl \
	${MD}/long-triangular-prism.stl \
	${MD}/ship-icon.stl \
	${MD}/heading_indicator.stl \
	${MD}/axis.stl \
	${MD}/scrambler.stl \
	${MD}/swordfish.stl \
	${MD}/wombat.stl \
	${MD}/spaceship_turret.stl \
	${MD}/spaceship_turret_base.stl \
	${MD}/vanquisher.stl \
	${MD}/docking_port.stl \
	${MD}/docking_port2.stl \
	${MD}/warpgate.stl \
	${MD}/escapepod.stl \
	${MD}/mantis.stl \
	${MD}/laser_turret.stl \
	${MD}/laser_turret_base.stl \
	${MD}/uv_sphere.stl \
	${MD}/warp-core.stl \
	${MD}/space_monster_torso.stl \
	${MD}/space_monster_tentacle_segment.stl \
	${MD}/cylinder.stl \
	${MD}/missile.stl

MYCFLAGS=-DPREFIX=${PREFIX} ${DEBUGFLAG} ${PROFILEFLAG} ${OPTIMIZEFLAG}\
	--pedantic -Wall ${STOP_ON_WARN} -pthread -std=gnu99 ${RDYNAMIC} \
	-Wno-extended-offsetof -Wno-gnu-folding-constant $(CFLAGS) -Wvla
GTKCFLAGS:=$(subst -I,-isystem ,$(shell pkg-config --cflags gtk+-2.0))
GLEXTCFLAGS:=$(subst -I,-isystem ,$(shell pkg-config --cflags gtkglext-1.0)) ${PNGCFLAGS}
GTKLDFLAGS:=$(shell pkg-config --libs gtk+-2.0) $(shell pkg-config --libs gthread-2.0)
GLEXTLDFLAGS:=$(shell pkg-config --libs gtkglext-1.0)
VORBISFLAGS:=$(subst -I,-isystem ,$(shell pkg-config --cflags vorbisfile))

ifeq (${V},1)
Q=
ECHO=echo
else
Q=@
ECHO=echo
endif

COMPILE=$(ECHO) '  COMPILE' $< && $(CC) ${MYCFLAGS} ${LUACFLAGS} -c -o $@ $<
GTKCOMPILE=$(ECHO) '  COMPILE' $< && $(CC) ${MYCFLAGS} ${GTKCFLAGS} -c -o $@ $<
LIMCOMPILE=$(ECHO) '  COMPILE' $< && $(CC) -DWITHOUTOPENGL=1 ${MYCFLAGS} ${GTKCFLAGS} -c -o $@ $<
GLEXTCOMPILE=$(ECHO) '  COMPILE' $< && $(CC) ${MYCFLAGS} ${GTKCFLAGS} ${GLEXTCFLAGS} -c -o $@ $<
VORBISCOMPILE=$(ECHO) '  COMPILE' $< && $(CC) ${MYCFLAGS} ${VORBISFLAGS} ${SNDFLAGS} -c -o $@ $<
SDLCOMPILE=$(ECHO) '  COMPILE' $< && $(CC) ${MYCFLAGS} ${SDLCFLAGS} ${GLEWCFLAGS} -c -o $@ $<
SNISSERVERDBGCOMPILE=$(ECHO) '  COMPILE' $< && $(CC) -DSNIS_SERVER_DATA ${MYCFLAGS} ${LUACFLAGS} -c -o snis_server_debug.o $<
SNISCLIENTDBGCOMPILE=$(ECHO) '  COMPILE' $< && $(CC) -DSNIS_CLIENT_DATA ${MYCFLAGS} ${LUACFLAGS} -c -o snis_client_debug.o $<

CLIENTLINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} ${SNDFLAGS} -o $@ ${GTKCFLAGS} ${GLEXTCFLAGS} ${CLIENTOBJS} ${GTKLDFLAGS} ${GLEXTLDFLAGS} ${LIBS} ${SNDLIBS} $(LDFLAGS)
LIMCLIENTLINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} ${SNDFLAGS} -o $@ ${GTKCFLAGS} ${LIMCLIENTOBJS} ${GLEXTLDFLAGS} ${LIBS} ${SNDLIBS} $(LDFLAGS)
SDLCLIENTLINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} ${SNDFLAGS} -o $@ ${SDLCFLAGS} ${SDLCLIENTOBJS} ${SDLLIBS} ${LIBS} ${SNDLIBS} $(LDFLAGS)
SERVERLINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} -o $@ ${SERVEROBJS} ${SERVERLIBS} $(LDFLAGS)
MULTIVERSELINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} -o $@ ${MULTIVERSEOBJS} ${MULTIVERSELIBS} $(LDFLAGS)
NEBULANOISELINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} -o $@ ${NEBULANOISEOBJS} ${NEBULANOISELIBS} $(LDFLAGS)
GENERATE_SKYBOX_LINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} -o $@ ${GENERATE_SKYBOX_OBJS} ${GENERATE_SKYBOX_LIBS} $(LDFLAGS)
OPENSCAD=$(ECHO) '  OPENSCAD' $< && openscad -o $@ $<
EXTRACTSCADPARAMS=$(ECHO) '  EXTRACT THRUST PARAMS' $@ && $(AWK) -f extract_scad_params.awk $< > $@
EXTRACTDOCKINGPORTS=$(ECHO) '  EXTRACT DOCKING PORTS' $@ && $(AWK) -f extract_docking_ports.awk $< > $@

ELOBJS=mtwist.o mathutils.o quat.o open-simplex-noise.o png_utils.o crater.o pthread_util.o
ELLIBS=-lm ${LRTLIB} -lpng
ELLINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} -o $@ ${GTKCFLAGS} earthlike.o ${ELOBJS} ${ELLIBS} $(LDFLAGS)
MCLIBS=-lm ${LRTLIB} -lpng
MCOBJS=png_utils.o
MCLINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} -o $@ ${GTKCFLAGS} util/mask_clouds.o ${MCOBJS} ${MCLIBS} $(LDFLAGS)

CMNMLIBS=-lm ${LRTLIB} -lpng
CMNMOBJS=png_utils.o
CMNMLINK=$(ECHO) '  LINK' $@ && $(CC) ${MYCFLAGS} -o $@ ${GTKCFLAGS} util/cloud-mask-normalmap.o ${CMNMOBJS} ${CMNMLIBS} $(LDFLAGS)

all:	${COMMONOBJS} ${SERVEROBJS} ${MULTIVERSEOBJS} ${CLIENTOBJS} ${LIMCLIENTOBJS} ${PROGS} ${BINPROGS} ${SCAD_PARAMS_FILES} ${DOCKING_PORT_FILES}

models:	${MODELS}

update-assets:
	@util/snis_update_assets.sh

check-assets:
	@util/snis_update_assets.sh --dry-run

build:	all

utils:	${UTILPROGS}

rootcheck.o:	rootcheck.c rootcheck.h Makefile
	$(Q)$(COMPILE)

graph_dev_opengl.o : graph_dev_opengl.c Makefile
	$(Q)$(GLEXTCOMPILE)

opengl_cap.o : opengl_cap.c Makefile
	$(Q)$(GLEXTCOMPILE)

graph_dev_gdk.o : graph_dev_gdk.c Makefile
	$(Q)$(GTKCOMPILE)

graph_dev_mesh_stub.o:	graph_dev_mesh_stub.c graph_dev_mesh_stub.h
	$(Q)$(COMPILE)

material.o : material.c Makefile
	$(Q)$(GTKCOMPILE)

shader.o : shader.c Makefile
	$(Q)$(COMPILE)

%.stl:	%.scad
	$(Q)$(OPENSCAD)

%.scad_params.h: %.scad
	$(Q)$(EXTRACTSCADPARAMS)

%.docking_ports.h: %.scad
	$(Q)$(EXTRACTDOCKINGPORTS)

thrust_attachment.o:	thrust_attachment.c thrust_attachment.h Makefile
	$(Q)$(COMPILE)

docking_port.o:	docking_port.c docking_port.h Makefile
	$(Q)$(COMPILE)

ui_colors.o:	ui_colors.c ui_colors.h snis_graph.h Makefile
	$(Q)$(COMPILE)

snis_keyboard.o:	snis_keyboard.c snis_keyboard.h string-utils.o Makefile
	$(Q)$(GTKCOMPILE)

snis_preferences.o:	snis_preferences.c snis_preferences.h string-utils.h snis_packet.h
	$(Q)$(COMPILE)

solarsystem_config.o:	solarsystem_config.c solarsystem_config.h string-utils.h Makefile
	$(Q)$(COMPILE)

solarsystem_config_test: solarsystem_config.c string-utils.o
	$(CC) ${MYCFLAGS} -DSOLARSYSTEM_CONFIG_TEST=1 -o $@ solarsystem_config.c string-utils.o

my_point.o:   my_point.c Makefile
	$(Q)$(COMPILE)

mesh.o:   mesh.c mikktspace/mikktspace.h Makefile
	$(Q)$(COMPILE)

pthread_util.o:	pthread_util.c pthread_util.h
	$(Q)$(COMPILE)

power-model.o:   power-model.c Makefile
	$(Q)$(COMPILE)

stacktrace.o:   stacktrace.c Makefile
	$(Q)$(COMPILE)

snis_ship_type.o:   snis_ship_type.c snis_ship_type.h corporations.h Makefile
	$(Q)$(COMPILE)

snis_faction.o:   snis_faction.c string-utils.h Makefile
	$(Q)$(COMPILE)

liang-barsky.o:   liang-barsky.c Makefile
	$(Q)$(COMPILE)

joystick.o:   joystick.c Makefile
	$(Q)$(COMPILE)

joystick_test:	joystick.c joystick.h Makefile
	$(CC) -g -DJOYSTICK_TEST -o joystick_test joystick.c

joystick_config.o:	joystick_config.c joystick_config.h string-utils.h
	$(Q)$(COMPILE)

ogg_to_pcm.o:   ogg_to_pcm.c Makefile
	$(Q)$(VORBISCOMPILE)

bline.o:	bline.c Makefile
	$(Q)$(COMPILE)

wwviaudio.o:    wwviaudio.c Makefile
	$(Q)$(VORBISCOMPILE)

shield_strength.o:	shield_strength.c Makefile
	$(Q)$(COMPILE)

snis_server.o:	snis_server.c Makefile build_info.h ${DOCKING_PORT_FILES}
	$(Q)$(COMPILE)

snis_multiverse.o:	snis_multiverse.c snis_multiverse.h Makefile build_info.h \
			snis_entity_key_value_specification.h
	$(Q)$(COMPILE)

snis_server_tracker.o:	snis_server_tracker.c snis_server_tracker.h pthread_util.h \
			ssgl/ssgl.h Makefile
	$(Q)$(COMPILE)

snis_client.o:	snis_client.c Makefile build_info.h ui_colors.h
	$(Q)$(GLEXTCOMPILE)

snis_limited_client.o:	snis_client.c Makefile build_info.h
	@echo -n "  (limited client) "
	$(Q)$(LIMCOMPILE)

mesh_viewer.o:	mesh_viewer.c Makefile build_info.h
	$(Q)$(SDLCOMPILE)

# simplexnoise1234.o:	simplexnoise1234.c Makefile build_info.h
#	$(Q)$(COMPILE)

open-simplex-noise.o:	open-simplex-noise.c Makefile build_info.h
	$(Q)$(COMPILE)

nebula_noise.o:	nebula_noise.c png_utils.h open-simplex-noise.h Makefile
	$(Q)$(COMPILE)

nebula_noise:	$(NEBULANOISEOBJS)
	$(Q)$(NEBULANOISELINK)

generate_skybox.o:	generate_skybox.c png_utils.h open-simplex-noise.h quat.h mtwist.h mathutils.h Makefile
	$(Q)$(COMPILE)

generate_skybox:	$(GENERATE_SKYBOX_OBJS)
	$(Q)$(GENERATE_SKYBOX_LINK)

earthlike.o:	earthlike.c
	$(Q)$(COMPILE)

util/mask_clouds.o:	util/mask_clouds.c
	$(Q)$(COMPILE)

util/cloud-mask-normalmap.o:	util/cloud-mask-normalmap.c
	$(Q)$(COMPILE)

util/sample_image_colors.o:	util/sample_image_colors.c png_utils.o
	$(Q)$(COMPILE)

util/sample_image_colors:	util/sample_image_colors.o png_utils.o
	$(CC) ${MYCFLAGS} -o $@ util/sample_image_colors.o png_utils.o ${PNGLIBS}

util/generate_solarsystem_positions.o:	util/generate_solarsystem_positions.c string-utils.o
	$(Q)$(COMPILE)

util/generate_solarsystem_positions:	util/generate_solarsystem_positions.o
	$(CC) ${MYCFLAGS} -o $@ util/generate_solarsystem_positions.o string-utils.o -lm

snis_socket_io.o:	snis_socket_io.c Makefile
	$(Q)$(COMPILE)

snis_marshal.o:	snis_marshal.c Makefile
	$(Q)$(COMPILE)

snis_opcode_def.o:	snis_opcode_def.c snis_opcode_def.h snis_packet.h Makefile
	$(Q)$(COMPILE)

rts_unit_data.o:	rts_unit_data.c rts_unit_data.h Makefile
	$(Q)$(COMPILE)

snis_bridge_update_packet.o:	snis_bridge_update_packet.c snis_bridge_update_packet.h Makefile
	$(Q)$(COMPILE)

snis_font.o:	snis_font.c Makefile
	$(Q)$(COMPILE)

mathutils.o:	mathutils.c Makefile
	$(Q)$(COMPILE)

crater.o:	crater.c crater.h Makefile
	$(Q)$(COMPILE)

test_crater.o:	test_crater.c
	$(Q)$(COMPILE)

snis_alloc.o:	snis_alloc.c Makefile
	$(Q)$(COMPILE)

snis_damcon_systems.o:	snis_damcon_systems.c Makefile
	$(Q)$(COMPILE)

snis_server:	${SERVEROBJS} ${SSGL} Makefile
	$(Q)$(SERVERLINK)

snis_client:	${CLIENTOBJS} ${SSGL} Makefile
	$(Q)$(CLIENTLINK)

snis_multiverse:	${MULTIVERSEOBJS} ${SSGL} Makefile
	$(Q)$(MULTIVERSELINK)

snis_limited_client:	${LIMCLIENTOBJS} ${SSGL} Makefile
	$(Q)$(LIMCLIENTLINK)

ssgl/lsssgl:
	(cd ssgl ; ${MAKE} )

ssgl/ssgl_server:
	(cd ssgl ; ${MAKE} )

bin/snis_client:	snis_client
	@mkdir -p bin
	@cp snis_client bin

bin/snis_multiverse:	snis_multiverse
	@mkdir -p bin
	@cp snis_multiverse bin

bin/snis_server:	snis_server
	@mkdir -p bin
	@cp snis_server bin

bin/snis_limited_client:	snis_limited_client
	@mkdir -p bin
	@cp snis_limited_client bin

bin/ssgl_server:	ssgl/ssgl_server
	@mkdir -p bin
	@cp ssgl/ssgl_server bin

bin/lsssgl:	ssgl/lsssgl
	@mkdir -p bin
	@cp ssgl/lsssgl bin

bin/snis_text_to_speech.sh:	snis_text_to_speech.sh
	@mkdir -p bin
	@cp snis_text_to_speech.sh bin/snis_text_to_speech.sh
	@chmod +x bin/snis_text_to_speech.sh

mesh_viewer:	${SDLCLIENTOBJS} ${SSGL} Makefile
	$(Q)$(SDLCLIENTLINK)
	@mkdir -p bin
	@cp mesh_viewer bin

earthlike:	earthlike.o ${ELOBJS} Makefile
	$(Q)$(ELLINK)

util/mask_clouds:	util/mask_clouds.o ${ELOBJS} Makefile
	$(Q)$(MCLINK)

util/cloud-mask-normalmap:	util/cloud-mask-normalmap.o ${CMNMOBJS} Makefile
	$(Q)$(CMNMLINK)

starbase-comms.o:	starbase-comms.c Makefile
	$(Q)$(COMPILE)

starbase_metadata.o:	starbase_metadata.c starbase_metadata.h Makefile
	$(Q)$(COMPILE)

infinite-taunt.o:	infinite-taunt.c Makefile
	$(Q)$(COMPILE)

infinite-taunt:	infinite-taunt.o names.o mtwist.o Makefile
	$(CC) -DTEST_TAUNT -o infinite-taunt ${MYCFLAGS} mtwist.o infinite-taunt.c names.o

names:	names.c names.h mtwist.o
	$(CC) -DTEST_NAMES -o names ${MYCFLAGS} ${GTKCFLAGS} mtwist.o names.c

snis_limited_graph.o:	snis_graph.c Makefile
	@echo -n "  (limited client) "
	$(Q)$(LIMCOMPILE)

snis_graph.o:	snis_graph.c Makefile
	$(Q)$(GLEXTCOMPILE)

ship_registration.o:	ship_registration.c ship_registration.h Makefile
	$(Q)$(COMPILE)

corporations.o:	corporations.c corporations.h Makefile
	$(Q)$(COMPILE)

snis_typeface.o:	snis_typeface.c Makefile
	$(Q)$(GTKCOMPILE)

snis_gauge.o:	snis_gauge.c Makefile
	$(Q)$(GTKCOMPILE)

snis_button.o:	snis_button.c Makefile
	$(Q)$(GTKCOMPILE)

snis_pull_down_menu.o:	snis_pull_down_menu.c snis_pull_down_menu.h Makefile
	$(Q)$(GTKCOMPILE)

snis_strip_chart.o:	snis_strip_chart.c Makefile
	$(Q)$(GTKCOMPILE)

snis_label.o:	snis_label.c Makefile
	$(Q)$(GTKCOMPILE)

snis_sliders.o:	snis_sliders.c snis_sliders.h ui_colors.h Makefile
	$(Q)$(GTKCOMPILE)

snis_text_window.o:	snis_text_window.c Makefile
	$(Q)$(GTKCOMPILE)

snis_ui_element.o:	snis_ui_element.c Makefile
	$(Q)$(GTKCOMPILE)

snis_text_input.o:	snis_text_input.c Makefile
	$(Q)$(GTKCOMPILE)

matrix.o:	matrix.c Makefile
	$(Q)$(COMPILE)

starmap_adjacency.o:	starmap_adjacency.c starmap_adjacency.h quat.o vec4.o
	$(Q)$(COMPILE)

replacement_assets.o:	replacement_assets.c replacement_assets.h
	$(Q)$(COMPILE)

snis_asset_dir.o:	snis_asset_dir.c snis_asset_dir.h
	$(Q)$(COMPILE)

stl_parser.o:	stl_parser.c Makefile
	$(Q)$(COMPILE)

stl_parser:	stl_parser.c matrix.o mesh.o mathutils.o quat.o mtwist.o mikktspace/mikktspace.o \
		string-utils.o Makefile
	$(CC) -DTEST_STL_PARSER ${MYCFLAGS} ${GTKCFLAGS} -o stl_parser stl_parser.c matrix.o mesh.o mathutils.o \
		quat.o mtwist.o mikktspace/mikktspace.o string-utils.o -lm $(LDFLAGS)

entity.o:	entity.c Makefile
	$(Q)$(GTKCOMPILE)

names.o:	names.c Makefile
	$(Q)$(COMPILE)

space-part.o:	space-part.c Makefile
	$(Q)$(COMPILE)

quat.o:	quat.c Makefile
	$(Q)$(COMPILE)

oriented_bounding_box.o:	oriented_bounding_box.c oriented_bounding_box.h
	$(Q)$(COMPILE)

turret_aimer.o:	turret_aimer.c turret_aimer.h quat.h mathutils.h
	$(Q)$(COMPILE)

vec4.o:	vec4.c Makefile
	$(Q)$(COMPILE)

arbitrary_spin.o:	arbitrary_spin.c arbitrary_spin.h Makefile
	$(Q)$(COMPILE)

a_star.o:	a_star.c a_star.h Makefile
	$(Q)$(COMPILE)

a_star_test.o:	a_star_test.c a_star.h Makefile
	$(Q)$(COMPILE)

a_star_test:	a_star_test.o a_star.o Makefile
	$(CC) -g -o a_star_test a_star_test.c a_star.o -lm

mtwist.o:	mtwist.c Makefile
	$(Q)$(COMPILE)

elastic_collision.o:	elastic_collision.c elastic_collision.h Makefile
	$(Q)$(COMPILE)

fleet.o:	fleet.c Makefile
	$(Q)$(COMPILE)

png_utils.o:	png_utils.c png_utils.h Makefile
	$(Q)$(COMPILE)

c-is-the-locale.o:	c-is-the-locale.c
	$(Q)$(COMPILE)

commodities.o:	commodities.c Makefile
	$(Q)$(COMPILE)

string-utils.o:	string-utils.c Makefile
	$(Q)$(COMPILE)

snis_tweak.o: snis_tweak.c snis_tweak.h Makefile
	$(Q)$(COMPILE)

snis_client_debug.o: snis_debug.c snis_debug.h Makefile
	$(Q)$(SNISCLIENTDBGCOMPILE)

snis_server_debug.o: snis_debug.c snis_debug.h Makefile
	$(Q)$(SNISSERVERDBGCOMPILE)

pronunciation.o:	pronunciation.c Makefile
	$(Q)$(COMPILE)

test_pronunciation:	pronunciation.c Makefile
	$(CC) -DTEST_PRONUNCIATION_FIXUP -o test_pronunciation pronunciation.c

planetary_atmosphere.o:	planetary_atmosphere.c Makefile
	$(Q)$(COMPILE)

test_planetary_atmosphere:	planetary_atmosphere.c mtwist.o Makefile
	$(CC) -g -DTEST_PLANETARY_ATMOSPHERE_PROFILE -o test_planetary_atmosphere planetary_atmosphere.c mtwist.o

key_value_parser.o:	key_value_parser.c key_value_parser.h Makefile
	$(Q)$(COMPILE)

test_key_value_parser:	key_value_parser.c key_value_parser.h Makefile
	$(CC) ${MYCFLAGS} -DTEST_KEY_VALUE_PARSER -o test_key_value_parser key_value_parser.c
	./test_key_value_parser

test-matrix:	matrix.c Makefile
	$(CC) ${MYCFLAGS} ${GTKCFLAGS} -DTEST_MATRIX -o test-matrix matrix.c -lm

test-space-partition:	space-part.c Makefile
	$(CC) ${MYCFLAGS} -g -DTEST_SPACE_PARTITION -o test-space-partition space-part.c -lm

snis_event_callback.o:	snis_event_callback.c Makefile
	$(Q)$(COMPILE)

snis_hash.o:	snis_hash.c snis_hash.h Makefile
	$(Q)$(COMPILE)

test_snis_crypt:	snis_hash.c snis_hash.h
	$(CC) -DTEST_SNIS_CRYPT -o test_snis_crypt snis_hash.c -lcrypt

snis_nl.o:	snis_nl.c snis_nl.h Makefile
	$(Q)$(COMPILE)

snis_nl:	snis_nl.o string-utils.o spelled_numbers.o
	$(CC) -g -DTEST_NL -o snis_nl string-utils.o spelled_numbers.o snis_nl.c

spelled_numbers.o:	spelled_numbers.c spelled_numbers.h Makefile
	$(Q)$(COMPILE)

spelled_numbers:	spelled_numbers.c
	$(CC) -g -DSPELLED_NUMBERS_TEST_CASE -o spelled_numbers spelled_numbers.c

${SSGL}:
	(cd ssgl ; ${MAKE} )

mikktspace/mikktspace.o:
	(cd mikktspace; ${MAKE} )

mostly-clean:
	rm -f ${SERVEROBJS} ${CLIENTOBJS} ${LIMCLIENTOBJS} ${SDLCLIENTOBJS} ${PROGS} ${SSGL} \
	${BINPROGS} ${UTILPROGS} stl_parser snis_limited_client.c \
	test-space-partition snis_test_audio.o snis_test_audio joystick_test local_termios2.h
	( cd ssgl; ${MAKE} clean )
	( cd mikktspace; ${MAKE} clean )

test-marshal:	snis_marshal.c stacktrace.o Makefile
	$(CC) -DTEST_MARSHALL -o test-marshal snis_marshal.c stacktrace.o

test-quat:	test-quat.c quat.o matrix.o mathutils.o mtwist.o Makefile
	$(CC) -Wall -Wextra --pedantic -o test-quat test-quat.c quat.o matrix.o mathutils.o mtwist.o -lm

test-fleet: quat.o fleet.o mathutils.o mtwist.o Makefile
	$(CC) -DTESTFLEET=1 -c -o test-fleet.o fleet.c
	$(CC) -DTESTFLEET=1 -o test-fleet test-fleet.o mathutils.o quat.o mtwist.o -lm

test-mtwist: mtwist.o test-mtwist.c Makefile
	$(CC) -o test-mtwist mtwist.o test-mtwist.c

snis-device-io.o:	snis-device-io.h snis-device-io.c Makefile
	$(CC) -Wall -Wextra --pedantic -pthread -c snis-device-io.c

device-io-sample-1:	device-io-sample-1.c snis-device-io.o
	$(CC) -Wall -Wextra --pedantic -pthread -o device-io-sample-1 snis-device-io.o \
			device-io-sample-1.c

nonuniform_random_sampler.o:	nonuniform_random_sampler.c nonuniform_random_sampler.h
	$(Q)$(COMPILE)

test_nonuniform_random_sampler:	nonuniform_random_sampler.o mathutils.o mtwist.o
	$(CC) -D TEST_NONUNIFORM_SAMPLER -o test_nonuniform_random_sampler mtwist.o mathutils.o -lm nonuniform_random_sampler.c

test-commodities:	commodities.o Makefile string-utils.o
	$(CC) -DTESTCOMMODITIES=1 -O3 -c commodities.c -o test-commodities.o
	$(CC) -DTESTCOMMODITIES=1 -o test-commodities string-utils.o test-commodities.o

test-obj-parser:	test-obj-parser.c stl_parser.o mesh.o mtwist.o mathutils.o matrix.o quat.o Makefile
	$(CC) -o test-obj-parser stl_parser.o mtwist.o mathutils.o matrix.o mesh.o quat.o -lm test-obj-parser.c

test:	test-matrix test-space-partition test-marshal test-quat test-fleet test-mtwist test-commodities test_solarsystem_config
	/bin/true	# Prevent make from running "$(CC) test.o".

test_solarsystem_config:	test_solarsystem_config.c solarsystem_config.o string-utils.o
	$(CC) -o $@ $< solarsystem_config.o string-utils.o

test_crater:	test_crater.o crater.o mathutils.o mtwist.o png_utils.o png_utils.o
	$(CC) -o $@ ${PNGCFLAGS} test_crater.o crater.o mtwist.o png_utils.o ${PNGLIBS} mathutils.o -lm

snis_client.6.gz:	snis_client.6
	gzip -9 - < snis_client.6 > snis_client.6.gz

snis_server.6.gz:	snis_server.6
	gzip -9 - < snis_server.6 > snis_server.6.gz

earthlike.1.gz:	earthlike.1
	gzip -9 - < earthlike.1 > earthlike.1.gz

snis_test_audio.1.gz:	snis_test_audio.1
	gzip -9 - < snis_test_audio.1 > snis_test_audio.1.gz

print_ship_attributes:	snis_entity_key_value_specification.h key_value_parser.o
	$(CC) -o print_ship_attributes print_ship_attributes.c key_value_parser.o

local_termios2.h:	termios2.h
	$(Q)./check_for_termios2.sh

snis_dmx.o:	snis_dmx.c snis_dmx.h Makefile local_termios2.h
	$(Q)$(COMPILE)

test_snis_dmx:	test_snis_dmx.c snis_dmx.o
	$(Q)$(CC) -pthread -o test_snis_dmx test_snis_dmx.c snis_dmx.o

snis_test_audio.o:	snis_test_audio.c Makefile ${SNDOBJS} ${OGGOBJ}
	$(Q)$(VORBISCOMPILE)

snis_test_audio:	snis_test_audio.o ${SNDLIBS} Makefile
	$(CC) -o snis_test_audio snis_test_audio.o ${SNDOBJS} ${OGGOBJ} ${SNDLIBS}

install:	${PROGS} ${MODELS} ${AUDIOFILES} ${TEXTURES} \
		${MATERIALS} ${CONFIGFILES} ${SHADERS} ${LUASCRIPTS} ${MANPAGES} ${SSGL} \
		${SOLARSYSTEMFILES} ${ESSENTIAL_SCRIPTS}
	@# First check that PREFIX is sane, and esp. that it's not pointed at source
	@mkdir -p ${DESTDIR}/${PREFIX}
	@touch ${DESTDIR}/${PREFIX}/.canary-in-the-coal-mine.canary
	@if [ -f .canary-in-the-coal-mine.canary ] ; then \
		echo 1>&2 ; \
		echo "DESTDIR/PREFIX is ${DESTDIR}/${PREFIX} -- cannot install here" 1>&2 ; \
		echo "Try: make PREFIX=/usr/local ; make PREFIX=/usr/local install" 1>&2  ; \
		echo 1>&2 ; \
		rm -f ${DESTDIR}/${PREFIX}/.canary-in-the-coal-mine.canary ; \
		exit 1 ; \
	fi
	@ rm -f ${DESTDIR}/${PREFIX}/.canary-in-the-coal-mine.canary
	mkdir -p ${DESTDIR}/${PREFIX}/bin
	${INSTALL} -m 755 ssgl/ssgl_server ${DESTDIR}/${PREFIX}/bin
	for x in ${PROGS} ${ESSENTIAL_SCRIPTS} ; do \
		${INSTALL} -m 755 bin/$$x \
				${DESTDIR}/${PREFIX}/bin; \
	done
	${AWK} '/^PREFIX=$$/ { printf("PREFIX='${PREFIX}'\n"); next; } \
		{ print; } ' < snis_launcher > /tmp/snis_launcher
	${INSTALL} -m 755 /tmp/snis_launcher ${DESTDIR}/${PREFIX}/bin
	rm -f /tmp/snis_launcher
	for d in ${MATERIALDIR} ${LUASCRIPTDIR} ${SHADERDIR} ${SOUNDDIR} \
		${TEXTUREDIR} ${MODELDIR}/wombat ${SHADERDIR} ; do \
		mkdir -p $$d ; \
	done
	${INSTALL} -m 644 ${CONFIGFILES} ${CONFIGFILEDIR}
	${INSTALL} -m 644 ${SOUNDFILES} ${SOUNDDIR}
	${INSTALL} -m 644 ${TEXTUREFILES} ${TEXTUREDIR}
	${INSTALL} -m 644  ${LUASCRIPTS} ${LUASCRIPTDIR}
	${INSTALL} -m 644  ${MATERIALFILES} ${MATERIALDIR}
	${INSTALL} -m 644  ${MODELS} ${MODELDIR}
	mkdir -p ${SOLARSYSTEMDIR}/default
	${INSTALL} -m 644 ${SOLARSYSTEMSRCDIR}/default/assets.txt ${SOLARSYSTEMDIR}/default
	for d in dreadknight disruptor conqueror enforcer starbase starbase2 cargocontainer research-vessel ; do \
		mkdir -p ${MODELDIR}/$$d ; \
		${INSTALL} -m 644 ${MODELSRCDIR}/$$d/$$d.mtl ${MODELDIR}/$$d ; \
		cp ${MODELSRCDIR}/$$d/$$d.obj ${MODELDIR}/$$d ; \
		cp ${MODELSRCDIR}/$$d/$$d.png ${MODELDIR}/$$d ; \
		if [ -f ${MODELSRCDIR}/$$d/$$d"lights.png" ] ; then \
			cp ${MODELSRCDIR}/$$d/$$d"lights.png" ${MODELDIR}/$$d ; \
		fi ; \
		if [ -f ${MODELSRCDIR}/$$d/$$d"-lighting.png" ] ; then \
			cp ${MODELSRCDIR}/$$d/$$d"-lighting.png" ${MODELDIR}/$$d ; \
		fi ; \
	done
	${INSTALL} -m 644 ${MODELSRCDIR}/dreadknight/dreadknight-exhaust-plumes.h ${MODELDIR}/dreadknight
	${INSTALL} -m 644 ${MODELSRCDIR}/wombat/snis3006lights.png ${MODELDIR}/wombat
	${INSTALL} -m 644 ${MODELSRCDIR}/wombat/snis3006.mtl ${MODELDIR}/wombat
	${INSTALL} -m 644 ${MODELSRCDIR}/wombat/snis3006.obj ${MODELDIR}/wombat
	${INSTALL} -m 644 ${MODELSRCDIR}/wombat/snis3006.png ${MODELDIR}/wombat
	${INSTALL} -m 644 ${DOCKING_PORT_FILES} ${MODELDIR}
	${INSTALL} -m 644 ${SCAD_PARAMS_FILES} ${MODELDIR}
	${INSTALL} -m 644 ${SHADERS} ${SHADERDIR}
	mkdir -p ${MANDIR}
	${INSTALL} -m 644 ${MANPAGES} ${MANDIR}
	mkdir -p ${DESKTOPDIR}
	${INSTALL} -m 644 ${DESKTOPFILES} ${DESKTOPDIR}
	${UPDATE_DESKTOP}

uninstall:
	@# check that PREFIX is sane
	@touch ${DESTDIR}/${PREFIX}/.canary-in-the-coal-mine.canary
	@if [ -f .canary-in-the-coal-mine.canary ] ; then \
		echo 1>&2 ; \
		echo "DESTDIR/PREFIX is ${DESTDIR}/${PREFIX} -- cannot uninstall here" 1>&2 ; \
		echo "Try: make PREFIX=/usr/local uninstall" 1>&2  ; \
		echo 1>&2 ; \
		rm -f ${DESTDIR}/${PREFIX}/.canary-in-the-coal-mine.canary ; \
		exit 1 ; \
	fi
	@rm -f ${DESTDIR}/${PREFIX}/.canary-in-the-coal-mine.canary
	if [ ! -d "${DESTDIR}/${PREFIX}" ] ; then \
		echo "DESTDIR/PREFIX is not a directory." 1>&2 ;\
		exit 1 ;\
	fi
	for x in ${PROGS} ; do \
		rm -f ${DESTDIR}/${PREFIX}/bin/$$x ; \
	done
	rm -f ${DESTDIR}/${PREFIX}/bin/ssgl_server
	rm -fr ${DESTDIR}/${PREFIX}/share/snis
	rm -f ${MANDIR}/snis_client.6.gz ${MANDIR}/snis_client.6
	rm -f ${MANDIR}/snis_server.6.gz ${MANDIR}/snis_server.6
	rm -f ${MANDIR}/earthlike.1.gz ${MANDIR}/earthlike.1
	rm -f ${DESKTOPDIR}/snis.desktop
	${UPDATE_DESKTOP}

clean:	mostly-clean
	rm -f ${MODELS} test_marshal test_crater

depend:
	rm -f Makefile.depend
	$(MAKE) Makefile.depend

Makefile.depend :
	# Do in 2 steps so that on failure we don't get an empty but "up to date"
	# dependencies file.
	makedepend -w0 -f- *.c | grep -v /usr | sort > Makefile.depend.tmp
	mv Makefile.depend.tmp Makefile.depend

check-endianness:	check-endianness.c
	$(CC) -o check-endianness check-endianness.c

build_info.h: check-endianness snis.h gather_build_info Makefile
	@echo "  GATHER BUILD INFO"
	$(Q)@./gather_build_info > build_info.h

cppcheck:
	cppcheck .

include Makefile.depend
