BUILD_DIR = m5stack_air_quality
YAML_FILE = $(BUILD_DIR).yaml

.PHONY: build clean requirements run

build:
	esphome compile $(YAML_FILE)

clean:
	rm -r $(BUILD_DIR)

requirements:
	pip3 install wheel
	pip3 install -r requirements.txt

run:
	esphome run $(YAML_FILE)
