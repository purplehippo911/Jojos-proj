.DEFAULT_GOAL := all
PREFIX ?= /usr/local
DESTDIR ?=

NAME := jojos
CC := cc
CFLAGS := -Wall -Wextra -O2 -Iinclude
LDLIBS := -lpthread -ldl -lm

SRCS := src/main.c
OBJS := $(SRCS:.c=.o)

BUILD_DIR := bin
TARGET := $(BUILD_DIR)/$(NAME)

BINDIR := $(PREFIX)/bin
DATADIR := $(PREFIX)/share/$(NAME)

all: $(TARGET) 

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(TARGET): $(OBJS) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@ $(LDLIBS)
install: $(TARGET)
	install -d "$(DESTDIR)$(BINDIR)"
	install -m 755 "$(TARGET)" "$(DESTDIR)$(BINDIR)/$(NAME)"
	install -d "$(DESTDIR)$(DATADIR)"
	install -m 644 src/assets/* "$(DESTDIR)$(DATADIR)/"
uninstall:
	rm -f "$(DESTDIR)$(BINDIR)/$(NAME)"
	rm -rf "$(DESTDIR)$(DATADIR)"
clean:
	rm -f $(OBJS)
	rm -rf $(BUILD_DIR)
run: all
	./bin/jojos

.PHONY: all install uninstall clean
