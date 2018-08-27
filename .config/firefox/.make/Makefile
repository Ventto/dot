PROFILE        := default
PINS_FILE      := $(HOME)/.config/firefox/pins/default.json

PROFILE_DIR    = $(HOME)/.config/firefox/profiles/$(PROFILE)
SESSION_DIR    = $(PROFILE_DIR)/sessionstore-backups
RECOVERY_FILE  = $(SESSION_DIR)/recovery.jsonlz4
SESSION_FILE   = $(PROFILE_DIR)/sessionstore.jsonlz4

all: $(RECOVERY_FILE)

$(RECOVERY_FILE): $(PINS_FILE)
	$(RM) -r $(SESSION_DIR) $(SESSION_FILE)
	mkdir -p $(SESSION_DIR)
	python3 mozlz4a.py $< $@

clean:
	$(RM) -r $(SESSION_DIR) $(SESSION_FILE)

test: checkout all
	sleep 1
	nohup firefox --profile $(PROFILE_DIR) >/dev/null 2>&1 &

checkout:
	killall firefox || /bin/true
	if [ -d ../default.bkp ]; then \
		$(RM) -r $(PROFILE_DIR); \
		git --git-dir="${HOME}/.config/dot/" --work-tree="${HOME}" checkout $(PROFILE_DIR); \
	else \
		mv $(PROFILE_DIR) ../default.bkp; \
		git --git-dir="${HOME}/.config/dot/" --work-tree="${HOME}" checkout $(PROFILE_DIR); \
	fi

stop-test:
	if [ ! -d ../default.bkp ]; then \
		echo "default.bkp: directory not found"; \
		/bin/false; \
	fi
	$(RM) -r $(PROFILE_DIR)
	mv ../default.bkp $(PROFILE_DIR)

.PHONY: all clean checkout stop-test test
