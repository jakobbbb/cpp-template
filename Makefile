.ONESHELL:
MAKEFLAGS += --no-print-directory

BUILD_DIR = build
SOURCE_DIRS = source
SOURCE_FILES = $(shell find $(SOURCE_DIRS) -type f -iregex ".*\.\(c\|h\)\(pp\|xx\|\)")


.PHONY: build
build: prepare-build
	cd $(BUILD_DIR)
	$(MAKE)

.PHONY: build-tests
build-tests: prepare-build
	cd $(BUILD_DIR)
	$(MAKE) tests

.PHONY: prepare-build
prepare-build:
	[[ -d $(BUILD_DIR) ]] || mkdir $(BUILD_DIR)
	cd $(BUILD_DIR)
	cmake ..


.PHONY: run-tests
run-tests:
	$(BUILD_DIR)/source/tests

.PHONY: test
test: build-tests run-tests


.PHONY: lint
lint:
	clang-format -n --Werror $(SOURCE_FILES)

.PHONY: codeformat
codeformat:
	clang-format -i $(SOURCE_FILES)


.PHONY: clean
clean:
	rm -fr $(BUILD_DIR)/
