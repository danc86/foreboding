include env.mk

PKGS=gtk+-2.0 gio-2.0
VALAFLAGS += $(foreach P,$(PKGS),--pkg $(P))
CFLAGS += $(shell pkg-config --cflags $(PKGS))
LDFLAGS += $(shell pkg-config --libs $(PKGS))
PROGRAM=foreboding
OBJS = gui.o

.PHONY: all
all: $(PROGRAM)

.PHONY: clean
clean:
	rm -rf $(PROGRAM) $(OBJS)

$(PROGRAM): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^

%.c: %.vala
	$(VALAC) $(VALAFLAGS) -C $<
