{{project.varprefix}}_FRONTEND_SRC_DIR:=$({{project.varprefix}}_FRONTEND_DIR)/src
{{project.varprefix}}_FRONTEND_SRC_DIR_TS:=$(shell find $({{project.varprefix}}_FRONTEND_SRC_DIR) \
                            -name \*.ts -o -name \*.json)
{{project.varprefix}}_FRONTEND_SRC_DIR_WML:=$(shell find $({{project.varprefix}}_FRONTEND_SRC_DIR) -name \*.wml)
{{project.varprefix}}_FRONTEND_LIB_DIR:=$({{project.varprefix}}_FRONTEND_DIR)/lib
{{project.varprefix}}_FRONTEND_JS_DIR_MAIN:=$({{project.varprefix}}_FRONTEND_LIB_DIR)/main.js
{{project.varprefix}}_FRONTEND_JS_BUILD:=$({{project.varprefix}}_FRONTEND_DIR)/public/app.js
{{project.varprefix}}_FRONTEND_JS_VARS:=$(HERE)/node_modules/@quenk/wml-widgets/lib/classNames.js
{{project.varprefix}}_FRONTEND_CSS_BUILD:=$({{project.varprefix}}_FRONTEND_DIR)/public/app.css
{{project.varprefix}}_FRONTEND_LESS:=$(shell find $({{project.varprefix}}_FRONTEND_DIR)/src/app -name \*.less)
{{project.varprefix}}_FRONTEND_APP_LESS_ENTRY:=$({{project.varprefix}}_FRONTEND_DIR)/src/less/app.less
{{project.varprefix}}_FRONTEND_LESS_DIR_MAIN:=$({{project.varprefix}}_FRONTEND_DIR)/src/less/main.less