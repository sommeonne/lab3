# Compiler settings
AM_CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic

# Directories
BIN_DIR = bin

# Files
SOURCES = main.cpp calc.cpp
OUTPUT = $(BIN_DIR)/program

# Build target
bin_PROGRAMS = program
program_SOURCES = $(SOURCES)

# Install rules
install-binPROGRAMS = $(OUTPUT)

# Clean up
clean-local:
	rm -rf $(BIN_DIR)

.PHONY: all clean

