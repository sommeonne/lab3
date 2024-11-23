CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -pedantic

SRC_DIR = src
BIN_DIR = bin

SOURCES = $(SRC_DIR)/main.cpp $(SRC_DIR)/calc.cpp
HEADERS = $(SRC_DIR)/calc.h
OUTPUT = $(BIN_DIR)/program

all: $(OUTPUT)

$(OUTPUT): $(SOURCES) $(HEADERS)
	mkdir -p $(BIN_DIR)
	$(CXX) $(CXXFLAGS) -o $(OUTPUT) $(SOURCES)

clean:
	rm -rf $(BIN_DIR)

.PHONY: all clean

