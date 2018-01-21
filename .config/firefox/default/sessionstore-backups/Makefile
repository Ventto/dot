PINNED_TABS = recovery.json
PINNED_TABS_ENC = $(PINNED_TABS)lz4
SESSION_FILES = recovery.baklz4 \
                previous.jsonlz4 \
                upgrade.jsonlz4-* \
                ../sessionstore.jsonlz4

all: $(PINNED_TABS_ENC)

$(PINNED_TABS_ENC): $(PINNED_TABS)
	@python3 mozlz4a.py $< $@

clean:
	$(RM) $(PINNED_TABS_ENC) $(SESSION_FILES)

.PHONY: all clean
