YAML_FILE = m5stack-air-quality-kit.yaml

.PHONY: build requirements run

build:
	esphome compile $(YAML_FILE)

requirements:
	pip3 install wheel
	pip3 install -r requirements.txt

run:
	esphome run $(YAML_FILE)
