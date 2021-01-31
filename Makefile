# Special instruction NOP - "Do nothing"
export nop := echo "ђ" > /dev/null
# Special instruction ERR - "Raise error"
export error := cat / 2>/dev/null

# Paths
export PROJECT_DIR := $$(pwd)
export INC_DIR := include
export SRC_DIR := src
export BIN_DIR := bin

# Target file name
target := $(BIN_DIR)/factorial

# Object files
export C_OBJ := $(patsubst $(SRC_DIR)/%.c,$(BIN_DIR)/%.o,$(wildcard $(SRC_DIR)/*.c))
export CPP_OBJ := $(patsubst $(SRC_DIR)/%.cpp,$(BIN_DIR)/%.o,$(wildcard $(SRC_DIR)/*.cpp))

# C language compiler 
export CC := g++
export CC_FLAGS = -c -I$(INC_DIR)

# C++ language compiler 
export CPPC := g++
export CPPC_FLAGS = -c -I$(INC_DIR)

.DEFAULT_GOAL: all
.PHONY: all clean clean-all re-build deps

all: deps $(target)

clean:
	rm -f $(BIN_DIR)/*.o
	rm -f *.bak $(SRC_DIR)/*.bak

clean-all:
	$(MAKE) clean
	rm -f $(target)

re-build:
	$(MAKE) clean all

deps:
	cd $(SRC_DIR) && $(MAKE)

$(target): $(C_OBJ) $(CPP_OBJ)
	$(CPPC) -o $@ $^
