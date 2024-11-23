AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = lab3
lab3_SOURCES = main.cpp calc.cpp calc.h

# Юніт-тестові файли
TEST_SOURCES = test_calculator.cpp

# Додаємо Google Test до компіляції
LIBS = -lgtest -lgtest_main -pthread

# Створення тестового виконуваного файлу
check_PROGRAMS = test_calculator
test_calculator_SOURCES = $(TEST_SOURCES)
test_calculator_LDADD = $(LIBS)

