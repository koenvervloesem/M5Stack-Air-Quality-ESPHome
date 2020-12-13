BUILD_DIR = m5stack_air_quality
YAML_FILE = $(BUILD_DIR).yaml

.PHONY: build clean requirements run

build:
	esphome $(YAML_FILE) compile

clean:
	rm -r $(BUILD_DIR)

requirements:
	pip3 install wheel
	pip3 install pillow https://github.com/esphome/esphome/archive/dev.zip

run:
	esphome $(YAML_FILE) run
