# gpSP makefile
# Gilead Kutnick - Exophase
# CHIP port - Fox Cunning

# Global definitions

CC        = $(CROSS_COMPILE)gcc

OBJS      = chip.o main.o menu.o cpu.o memory.o video.o input.o sound.o gui.o \
            cheats.o zip.o cpu_threaded.o arm_stub.o video_blend.o warm.o \
            upscale_aspect.o neon_scaler.o configfile_fk.o
BIN       = gpsp

# Platform specific definitions 

VPATH      += .. ../arm ../gp2x

# expecting to have PATH set up to get correct sdl-config first
CFLAGS = $(TARGET_CFLAGS) $(subst $\",,$(BR2_TARGET_OPTIMIZATION)) -mfloat-abi=hard -ffast-math -funsafe-math-optimizations

CFLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
LIBS = $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)

CFLAGS += -ggdb -O3
CFLAGS += -DARM_ARCH -DCHIP_BUILD
LIBS += -lSDL_ttf -lSDL_image -ldl -lpthread -lz

# Compilation:

all:	$(BIN)

%.o: %.S
	$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.s
	$(CC) $(CFLAGS) -c -o $@ $<

main.o: CFLAGS += -marm
cpu.o cpu_threaded.o video.o: CFLAGS += -marm -Wno-unused-variable -Wno-unused-label -fprefetch-loop-arrays

$(BIN): $(OBJS)
	$(CC) $(OBJS) $(LIBS) -o $(BIN)

clean:
	rm -f *.o $(BIN) picorestore

# Installation

install: gpsp ../game_config.txt
	cp gpsp /usr/games/
	cp ../game_config.txt /usr/games/

# ----------- release -----------

rel: gpsp ../game_config.txt ../COPYING.DOC
	rm -rf out
	mkdir out
	cp $^ out/
