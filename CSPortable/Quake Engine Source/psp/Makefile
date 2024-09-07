PSPSDK = $(shell psp-config --pspsdk-path)
PSPLIBSDIR = $(PSPSDK)/..
TARGET = Quake
EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_PIC1 = pics/PIC1.png
PSP_EBOOT_ICON = pics/ICON0.png
PSP_EBOOT_TITLE = CSPortable


BUILD_PRX=1
PSP_FW_VERSION=500


#MODE=-DKERNEL_MODE

COMMON_OBJS = \
	input.o \
	main.o \
	math.o \
	sound.o \
	system.o \
	module.o \
	network.o \
	network_psp.o \
	gethost.o \
	fnmatch.o \
	\
	../cd_null.o \
	../chase.o \
	../cl_demo.o \
	../cl_input.o \
	../cl_main.o \
	../cl_parse.o \
	../cl_tent.o \
	../cmd.o \
	../common.o \
	../console.o \
	../crc.o \
	../cvar.o \
	../host.o \
	../host_cmd.o \
	../keys.o \
	../mathlib.o \
	../menu.o \
	../net_dgrm.o \
	../net_loop.o \
	../net_main.o \
	../net_vcr.o \
	../pr_cmds.o \
	../pr_edict.o \
	../pr_exec.o \
	../r_part.o \
	../snd_dma.o \
	../snd_mem.o \
	../snd_mix.o \
	../sbar.o \
	../sv_main.o \
	../sv_move.o \
	../sv_phys.o \
	../sv_user.o \
	../view.o \
	../wad.o \
	../world.o \
	../zone.o \
	../slist.o \
	
HARDWARE_VIDEO_ONLY_OBJS = \
	clipping.o \
	video_hardware.o \
	video_hardware_draw.o \
	video_hardware_entity_fragment.o \
	video_hardware_light.o \
	video_hardware_main.o \
	video_hardware_mesh.o \
	video_hardware_misc.o \
	video_hardware_model.o \
	video_hardware_screen.o \
	video_hardware_surface.o \
	video_hardware_warp.o \
	vram.o
HARDWARE_VIDEO_ONLY_FLAGS = -DPSP_HARDWARE_VIDEO

	
OBJS = $(COMMON_OBJS) $(HARDWARE_VIDEO_ONLY_OBJS)

#LIBS = -lpspaudiolib -lpspaudio -lpspgum -lpspgu -lpsprtc -lpsppower -lpspwlan -lstdc++ -lm

GU_LIBS	    = -lpspgum_vfpu -lpspvfpu -lpspgu -lpspgum -lm
AUDIO_LIBS	= -lpspaudiolib -lpspaudio m33libs/libpspaudiocodec.a m33libs/libpspkubridge.a

MISC_LIBS	= -lpsprtc -lpsppower -lpspwlan -lpspnet_adhoc -lpspnet_adhocctl
STD_LIBS	= -lstdc++ -lm -lc
LIBS		= $(GU_LIBS) $(AUDIO_LIBS) $(MISC_LIBS) $(STD_LIBS)

CFLAGS = -ffast-math -O3 -G0 -Wall -Did386="0" -DPSP $(MODE) $(HARDWARE_VIDEO_ONLY_FLAGS) -DPSP_MP3_HWDECODE
CXXFLAGS = -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS) -c

include $(PSPSDK)/lib/build.mak

ifneq ($(VS_PATH),)
CC       = vs-psp-gcc
CXX      = vs-psp-g++
endif

