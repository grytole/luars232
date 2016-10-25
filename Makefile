################################################################################
#
#   Simple makefile for building luars232 plugin for Love2D with MinGW
#   Original library version: https://github.com/ynezz/librs232
# 
# === Love2D 0.10.1 (32-bit) ===
#
#   1. Run 'make LUALIB=/path/to/love2d' (folder with 'lua51.dll' file);
#   2. Copy 'luars232.dll' into Love2D folder.
#
#     or
#
#   1. Copy 'lua51.dll' library from Love2D folder into this folder;
#   2. Run 'make';
#   3. Copy 'luars232.dll' into Love2D folder.
# 
# === Love2D 0.10.1 (64-bit) ===
#
#   1. Run 'make CC=x86_64-w64-mingw32-gcc LUALIB=/path/to/love2d'
#      (folder with 'lua51.dll' file);
#   2. Copy 'luars232.dll' into Love2D folder.
#
#     or
#
#   1. Copy 'lua51.dll' library from Love2D folder into this folder;
#   2. Run 'make CC=x86_64-w64-mingw32-gcc';
#   3. Copy 'luars232.dll' into Love2D folder.
# 
################################################################################

CC = i686-w64-mingw32-gcc
LUALIB = .

SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

%.o : %.c
	$(CC) -g -O2 -DWIN32 -DRS232_EXPORT -I. -c $< -o $@

all: $(OBJ)
	$(CC) -shared -s -o luars232.dll $^ -fPIC -L$(LUALIB) -llua51

clean:
ifeq ($(OS),Windows_NT)
	del /Q /F $(OBJ) luars232.dll
else
	rm -f $(OBJ) luars232.dll
endif

