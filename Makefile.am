AUTOMAKE_OPTIONS = foreign

# Define the main program
bin_PROGRAMS = lab3
lab3_SOURCES = main.cpp calc.cpp calc.h  # Source files for the 'lab3' program

# Define the test program
check_PROGRAMS = test_calculator
test_calculator_SOURCES = test_calculator.cpp calc.cpp  # Add necessary test sources

# Linker flags for test program
test_calculator_LDFLAGS = -pthread  # Correct place for '-pthread'

# Additional libraries needed for tests
test_calculator_LDADD = -lgtest -lgtest_main  # Link with Google Test libraries

# Add other necessary rules for your project if needed

