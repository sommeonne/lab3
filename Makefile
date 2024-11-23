# Compiler
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic

# Directories
BIN_DIR = bin

# Files
SOURCES = main.cpp calc.cpp
HEADERS = calc.h
OUTPUT = $(BIN_DIR)/program

# Build target
all: $(OUTPUT)

# Link and create executable
$(OUTPUT): $(SOURCES) $(HEADERS)
	mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $(OUTPUT) $(SOURCES)

# Clean
clean:
	rm -rf $(BIN_DIR)

.PHONY: all clean

