$({{project.varprefix}}_FRONTEND_DIR): $({{project.varprefix}}_FRONTEND_JS_BUILD)\
                      $({{project.varprefix}}_FRONTEND_CSS_BUILD)
	mkdir -p $@
	touch $@

$({{project.varprefix}}_FRONTEND_JS_BUILD): $({{project.varprefix}}_FRONTEND_LIB_DIR)
	$(BROWSERIFY) $({{project.varprefix}}_FRONTEND_JS_DIR_MAIN) \
	$(if $(findstring yes,$(DEBUG)),,|$(UGLIFYJS)) > \
	$({{project.varprefix}}_FRONTEND_JS_BUILD) > $@

$({{project.varprefix}}_FRONTEND_LIB_DIR): $(CSA_WIDGETS_DIR)\
			  $(CIS_WIDGETS_DIR)\
			  $(HCIS_COLUMNS_DIR)\
			  $({{project.varprefix}}_FRONTEND_SRC_DIR_WML)\
                          $({{project.varprefix}}_FRONTEND_SRC_DIR_TS)
	rm -R $@ 2> /dev/null || true 
	mkdir -p $@
	cp -R -u $({{project.varprefix}}_FRONTEND_SRC_DIR)/* $@
	$(WMLC) $@
	$(TSC) --project $@
	touch $@

$({{project.varprefix}}_FRONTEND_CSS_BUILD): $(CSA_WIDGETS_LESS_FILE)\
			    $(CIS_WIDGETS_LESS_FILE)\
	                    $({{project.varprefix}}_FRONTEND_APP_LESS_ENTRY)\
                            $({{project.varprefix}}_FRONTEND_LESS_DIR_MAIN) 
	$(LESSC) $(if $(findstring yes,$(DEBUG)),--source-map-less-inline,) \
	--js-vars=$({{project.varprefix}}_FRONTEND_JS_VARS) $({{project.varprefix}}_FRONTEND_LESS_DIR_MAIN) |\
	$(CLEANCSS) > $@

$({{project.varprefix}}_FRONTEND_APP_LESS_ENTRY): $({{project.varprefix}}_FRONTEND_LESS)
	echo "" > $@
	$(foreach f,$({{project.varprefix}}_FRONTEND_LESS),\
	echo '@import "..$(subst $({{project.varprefix}}_FRONTEND_SRC_DIR),,$(f))";' >> $@ && ) true
