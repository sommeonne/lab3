# Makefile.am для деб-пакування
AUTOMAKE_OPTIONS = foreign

bin_PROGRAMS = lab3
calculator_SOURCES = main.cpp calc.cpp calc.h

# Задаємо власні правила для створення пакету .deb
dist_deb:
	@echo "Створення Debian пакету..."
	# Перевірка на наявність директорії debian
	mkdir -p debian
	cd debian && dh_make --createorig -s -y --packagename=lab3

