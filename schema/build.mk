$(PROJECT_SCHEMA_DIR): $(shell find $(PROJECT_SCHEMA_DIR) -type f)
	touch $@
