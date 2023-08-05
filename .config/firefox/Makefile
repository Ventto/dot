PROFILE_NAME = Ventto
PROFILE_DIR = $(CURDIR)
OUR_PREFS_OVERRIDES = $(PROFILE_DIR)/user-overrides.js

PROFILES_STORE_DIR  = $(HOME)/.mozilla/firefox
PROFILES_INI        = $(PROFILES_STORE_DIR)/profiles.ini
INSTALLS_INI        = $(PROFILES_STORE_DIR)/installs.ini

ARKENFOX_BASEURL          = https://raw.githubusercontent.com/arkenfox/user.js/master
ARKENFOX_UPDATER          = $(PROFILE_DIR)/updater.sh
ARKENFOX_PREFSCLEANER     = $(PROFILE_DIR)/prefsCleaner.sh
ARKENFOX_PREFSCLEANER_URL = $(ARKENFOX_BASEURL)/$(notdir $(ARKENFOX_PREFSCLEANER))
ARKENFOX_UPDATER_URL      = $(ARKENFOX_BASEURL)/$(notdir $(ARKENFOX_UPDATER))

define DEFAULT_PROFILE
	[Install4F96D1932A9F858E]
	Default=$(PROFILE_DIR)

	[Profile0]
	$(PROFILES_INI)
	Name=$(PROFILE_NAME)
	IsRelative=0
	Path=$(PROFILE_DIR)
	Default=1

	[General]
	Version=2
endef

export DEFAULT_PROFILE

all: prefscleaner profile-default

.PHONY: help
help: ## Prints this help
	@echo Available targets:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Make our profile the only and default existing one.
profile-default:
	$(RM) $(INSTALLS_INI)
	@echo -e "$$DEFAULT_PROFILE" | sed 's/^.//' > $(PROFILES_INI)
.PHONY: profile

$(ARKENFOX_PREFSCLEANER):
	curl -o "$@" "$(ARKENFOX_PREFSCLEANER_URL)"
	chmod +x $@

$(ARKENFOX_UPDATER):
	curl -o "$@" "$(ARKENFOX_UPDATER_URL)"
	chmod +x $@

.PHONY: prefscleaner
prefscleaner: prefsupdater $(ARKENFOX_PREFSCLEANER)
	cd $(PROFILE_DIR) && $(ARKENFOX_PREFSCLEANER) -s

.PHONY: prefsupdater
prefsupdater: $(ARKENFOX_UPDATER) $(OUR_PREFS_OVERRIDES)
	$(ARKENFOX_UPDATER) -u -s -p "$(PROFILE_DIR)" -o "$(OUR_PREFS_OVERRIDES)"

clean:
	$(RM) $(ARKENFOX_PREFSCLEANER) \
	      $(ARKENFOX_UPDATER)
