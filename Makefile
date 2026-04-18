PREFIX ?= /usr/local
DESTDIR ?=

NAME := jojos
CC := cc
CFLAGS := -lpthread -ldl -lm

SRCS := src/main.c
OBJS := $(SRCS:.c=.o)

BINDIR := $(PREFIX)/bin
DATADIR := $(PREFIX)/share/$(NAME)

all: $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

src/%.o: src/%.c
	$(CC) $(CFLAGS) -c $< -o $@
install: $(NAME)
	install -d "$(DESTDIR)$(BINDIR)"
	install -m 755 "$(NAME)" "$(DESTDIR)$(BINDIR)/$(NAME)"
	install -d "$(DESTDIR)$(DATADIR)"
	install -m 644 src/assets/* "$(DESTDIR)$(DATADIR)/"
uninstall:
	rm -f "$(DESTDIR)$(BINDIR)/$(NAME)"
	rm -rf "$(DESTDIR)$(DATADIR)"
clean:
	rm -f $(OBJS) $(NAME)
