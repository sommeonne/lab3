AC_INIT([Calculator Program], [1.0], [brukaliuk.serhii@lll.kpi.ua])
AC_CONFIG_AUX_DIR([build-aux])   # Move this before AM_INIT_AUTOMAKE
AM_INIT_AUTOMAKE([foreign])
AC_PROG_CXX
AC_PROG_CC
AC_CONFIG_FILES([Makefile])

# Перевіряємо наявність Google Test
AC_CHECK_LIB([gtest], [main], [], [AC_MSG_ERROR([Google Test library not found])])  # Fixed the missing closing parenthesis

AC_OUTPUT
