BARS = build/i3bar-%-bottom.conf build/i3bar-%-top.conf

.PHONY: all
all: build lua legacy

build:
	mkdir -p $@

.PHONY: lua legacy
lua:  %: $(BARS)
legacy: %: $(BARS)

i3bar-%:
	@version=$$(echo "$@" | cut -d'-' -f2);                     \
	side=$$(echo "$@" | cut -d'-' -f3 | cut -d'.' -f1);         \
	cat "config/$${version}.conf" |                             \
	sed -e "/{i3bar}/r i3bar-$${side}.conf" -e '/{i3bar}/d' > $@

.PHONY: clean
clean:
	$(RM) -r build
