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
	mkdir -p $(BIN_DIR)  # Створює папку bin, якщо її ще немає
	$(CXX) $(CXXFLAGS) -o $(OUTPUT) $(SOURCES)  # Компілює програму в папку bin

.PHONY: all

