SESSION_DIR   = ../default/sessionstore-backups

RECOVERY_FILE = $(SESSION_DIR)/recovery.jsonlz4

SESSION_FILES = $(SESSION_DIR)/previous.jsonlz4  \
                $(SESSION_DIR)/recovery.baklz4   \
                $(SESSION_DIR)/upgrade.jsonlz4-* \
                $(SESSION_DIR)/../sessionstore.jsonlz4

all: $(RECOVERY_FILE)

$(RECOVERY_FILE): pinned-tabs.json
	@$(RM) $(SESSION_FILES)
	python3 mozlz4a.py $< $@

.PHONY: all
