# Build script for {{{project.name}}}.
# 
# This script is intended to build an acyclical dependency graph
# of your projects build into $PROJECT_DEST_DIR.
#
# Try to separate complex sub-builds into the packages folder where possible.

### Current location. ###
HERE=$(shell pwd)

### Binaries. ###
TDC?=$(HERE)/node_modules/.bin/tdc
TSC?=$(HERE)/node_modules/.bin/tsc
MKDIRP?=mkdir -p
FIND?=find
CP?=cp
CPR?=$(CP) -R
RMR?=-rm -R
TOUCH?=touch

### Helper macros. ###

# EOL marker
define EOL


endef

### Settings. ###
PROJECT_SRC_DIR:=$(HERE)/src
PROJECT_SRC_DIR_FILES:=$(shell $(FIND) $(PROJECT_SRC_DIR) -type f)
PROJECT_PACKAGES_DIR:=$(HERE)/packages

PROJECT_PACKAGES_DIR_FILES:=$(shell $(FIND) $(PROJECT_PACKAGES_DIR) \
			    -maxdepth 1 -mindepth 1 -type d)

PROJECT_BUILD_DIR:=$(HERE)/{{{project.build.directory}}}

### Dependency Graph ###

# The whole application gets built to here.
$(PROJECT_BUILD_DIR): $(shell $(FIND) $(PROJECT_PACKAGES_DIR) -maxdepth 1 -mindepth 1 -type d)
	rm -R $@ || true
	mkdir -p $@
	cp -R $(PROJECT_SRC_DIR)/* $@
	$(TSC) -p $@
	$(TOUCH) $(PROJECT_BUILD_DIR)

#Include *.mk files here.


# Remove the build application files.
.PHONY: clean
clean: 
	rm -R $(PROJECT_BUILD_DIR) || true
