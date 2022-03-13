HERE=$(shell pwd)
SHELL=/bin/bash -o pipefail

TDC?=$(HERE)/node_modules/.bin/tdc
TSC?=$(HERE)/node_modules/.bin/tsc
LESSC?=$(HERE)/node_modules/.bin/lessc
BROWSERIFY?=./node_modules/.bin/browserify
WMLC?=./node_modules/.bin/wmlc
LESSC?=./node_modules/.bin/lessc
CLEANCSS?=$(HERE)/node_modules/.bin/cleancss
UGLIFYJS?=$(HERE)/node_modules/.bin/uglifyjs
TSFMT?=./node_modules/.bin/tsfmt
TRANSFORM?=node ./node_modules/.bin/transform
DAGEN?=./node_modules/.bin/dagen
CAMELCASE?=node ./node_modules/.bin/transform -t camelcase

### Helper macros. ###

# EOL marker
define EOL


endef

### Settings. ###
PROJECT_SRC_DIR:=$(HERE)/src
PROJECT_SRC_DIR_FILES:=$(shell $(FIND) $(PROJECT_SRC_DIR) -type f)
PROJECT_BUILD_DIR:=$(HERE)/build
PROJECT_BUILD_MAIN_DIR:=$(PROJECT_BUILD_DIR)/main

PROJECT_PACKAGES_DIR:=$(HERE)/packages
PROJECT_PACKAGES:=$(shell find $(PROJECT_PACKAGES_DIR) -maxdepth 1 -mindepth 1 -type d)

CLEAN_TARGETS:=lib

PROJECT_SCHEMA_DIR:=$(HERE)/schema
PROJECT_FRONTEND_DIR:=$(HERE)/frontend
# Declare variables for each packages in package here.
# Example: APP_COMMON_DIR:=$(PROJECT_PACKAGES_DIR)/app-common

include $(PROJECT_SCHEMA_DIR)/variables.mk
include $(PROJECT_PACKAGES_DIR)/*/variables.mk
include $(PROJECT_FRONTEND_DIR)/variables.mk

### Dependency Graph ###

.DELETE_ON_ERROR:

# The whole application gets built to here.
# Remember to add a dependency here for each of your extra packages.
$(PROJECT_BUILD_DIR): $(PROJECT_SRC_DIR_FILES) \
                      $(PROJECT_SCHEMA_DIR) \
		      $(shell find $(PROJECT_PACKAGES_DIR) -type d)\
                      $(PROJECT_FRONTEND_DIR)
	mkdir -p $@
	cp -R -u $(PROJECT_SRC_DIR)/* $@
	$(TDC) $(PROJECT_BUILD_MAIN_DIR)
	$(TSC) -p $@
	touch $(PROJECT_BUILD_DIR)

# Include *.mk files here.
include $(PROJECT_SCHEMA_DIR)/build.mk
include $(PROJECT_PACKAGES_DIR)/*/build.mk
include $(PROJECT_FRONTEND_DIR)/build.mk

# Remove the build application files.
.PHONY: clean
clean: 
	rm -R $(CLEAN_TARGETS) || true
