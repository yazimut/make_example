.DEFAULT_GOAL: all
.PHONY: all deps

export INC_DIR := ../$(INC_DIR)
export BIN_DIR := ../$(BIN_DIR)

# C language compiler 
export CC_FLAGS := -c -I$(INC_DIR)

# C++ language compiler 
export CPPC_FLAGS := -c -I$(INC_DIR)

all: deps $(patsubst %.c,$(BIN_DIR)/%.o,$(wildcard *.c)) $(patsubst %.cpp,$(BIN_DIR)/%.o,$(wildcard *.cpp))

deps:
	makedepend -I$(INC_DIR) -p$(BIN_DIR)/ -m $(wildcard *.c) $(wildcard *.cpp) 2> /dev/null

$(BIN_DIR)/%.o: %.c
	$(CC) $(CC_FLAGS) -o $@ $<

$(BIN_DIR)/%.o: %.cpp
	$(CPPC) $(CPPC_FLAGS) -o $@ $<

# Auto detecting dependencies...
# DO NOT DELETE

../bin/factorial.o: ../include/daemon/factorial.h
../bin/main.o: ../include/daemon/main.hpp ../include/daemon/factorial.h
