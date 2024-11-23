# -*- Autoconf -*-
AC_PREREQ([2.69])
AC_INIT([my_project], [1.0], [your.email@example.com])

# Set the minimum version of Automake and Automake setup
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([foreign])

# Check for the C++ compiler
AC_PROG_CXX

# Debian packaging check
AC_PATH_PROG([DPKG], [dpkg-buildpackage])

# Define the Makefile
AC_CONFIG_FILES([Makefile])

# Output the configuration scripts
AC_OUTPUT

