CFLAGS ?= -Wall

OBJECTS = winuae-hrtmon.rom-extract.o hrtmon.rom.o
TARGET = winuae-hrtmon.rom-extract

HRTMON_ROM_CPP_URL = https://raw.githubusercontent.com/tonioni/WinUAE/master/hrtmon.rom.cpp
HRTMON_ROM = hrtmon.rom

.PHONY: all clean extract distclean

all: $(TARGET)

hrtmon.rom.cpp:
ifeq ("$(wildcard $@)", "")
	$(shell wget $(HRTMON_ROM_CPP_URL))
endif

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS)

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

.cpp.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	$(RM) *.o $(TARGET)

extract: $(TARGET)
	$(RM) $(HRTMON_ROM)
	./$(TARGET)
	gunzip -v $(HRTMON_ROM).gz

distclean: clean
	$(RM) $(HRTMON_ROM) $(HRTMON_ROM).cpp $(HRTMON_ROM).gz
