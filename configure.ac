# -*- Autoconf -*-
AC_PREREQ([2.69])
AC_INIT([my_project], [1.0], [brukaliuk.serhii@lll.kpi.ua])
AM_INIT_AUTOMAKE([foreign])

# Check for the C++ compiler
AC_PROG_CXX

# Set the minimum version of Autoconf and Automake
AC_CONFIG_AUX_DIR([build-aux])

# Define the Makefile
AC_CONFIG_FILES([Makefile])

# Debian packaging check
AC_PATH_PROG([DPKG], [dpkg-buildpackage])

# Output the configuration scripts
AC_OUTPUT
