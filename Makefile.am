AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = lab3
calculator_SOURCES = main.cpp calc.cpp calc.h

# For the test executable, ensure linker flags are correctly placed
test_calculator_LDFLAGS = -pthread

# Add your test sources here
test_calculator_SOURCES = test_calculator.cpp

# Your custom rules for Debian packaging (if you still need them)
dist_deb:
	@echo "Creating Debian package..."
	mkdir -p debian
	cd debian && dh_make --createorig -s -y --packagename=lab3

