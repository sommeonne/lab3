# Makefile.am for Automake project

# Define the bin programs
bin_PROGRAMS = program

# Include source files
program_SOURCES = main.cpp calc.cpp

# Define the headers
program_HEADERS = calc.h

# Install the headers to the $(includedir)
# The 'dist_include_HEADERS' variable is used for distributing the headers
dist_include_HEADERS = calc.h

# Define the directory where the headers will be installed
# This is the default directory for headers in Automake projects
includedir = $(prefix)/include

# Install the program
install-binPROGRAMS = program
_
