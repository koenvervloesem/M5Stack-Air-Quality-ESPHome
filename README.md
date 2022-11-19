# ESPHome configuration for the M5Stack PM2.5 Air Quality Kit

[![Build status](https://github.com/koenvervloesem/M5Stack-Air-Quality-ESPHome/workflows/Build/badge.svg)](https://github.com/koenvervloesem/M5Stack-Air-Quality-ESPHome/actions)
[![GitHub license](https://img.shields.io/github/license/koenvervloesem/M5Stack-Air-Quality-ESPHome.svg)](https://github.com/koenvervloesem/M5Stack-Air-Quality-ESPHome/blob/main/LICENSE)

This [ESPHome](https://esphome.io) configuration builds firmware for M5Stack's [PM2.5 Air Quality Kit (PMSA003 + SHT20)](https://m5stack.com/products/pm-2-5-sensor-usb-power-sht20). It shows:

* The amount of particulate matter (PM1, PM2.5 and PM10).
* The temperature and humidity, as well as the computed vapour-pressure deficit and dew point.

![ESPHome configuration for the M5Stack air quality kit](https://github.com/koenvervloesem/M5Stack-Air-Quality-ESPHome/raw/main/m5stack-air-quality-kit-esphome.jpg)

## Requirements

* M5Stack's [PM2.5 Air Quality Kit (PMSA003 + SHT20)](https://m5stack.com/products/pm-2-5-sensor-usb-power-sht20)
* ESPHome 1.16.0 or later.

The SHT20 sensor is not supported by ESPHome, but this repository adds a custom component that's using the Arduino library [uFire_SHT20](https://github.com/u-fire/uFire_SHT20) which supports the sensor.

## Usage

Compile and upload the firmware to your M5Stack air quality kit with:

```shell
esphome run m5stack-air-quality-kit.yaml
```

The YAML file doesn't configure any Wi-Fi connection, MQTT broker or native API for Home Assistant. You can add this yourself. The configuration has been tested extensively with MQTT. If you have set up Home Assistant MQTT discovery, the sensors of the device even automatically show up in Home Assistant.

The middle button is used to toggle the display's backlight on and off.

## Remarks about the temperature and humidity readings

The SHT20 sensor shows a much too high temperature and much too low humidity. This doesn't seem to be a software problem: I tried a couple of other libraries for the SHT20 with the M5Stack air quality kit and they all have the same result.

According to Sensirion's [data sheet of the SHT20](https://www.sensirion.com/SHT20), you shouldn't do more than two measurements per second at 12-bit accuracy, to prevent self-heating of the sensor. In my custom sensor component, I configured polling every second to stay on the safe side.

But even this doesn't solve the problem. I suspect M5Stack's hardware design is faulty and the sensor really reads the heat produced by the other components in the M5Stack Core case.

## TODO

* Change the interface to something nicer. I'm not a designer, so I welcome any suggestions or pull requests.
* Use the left and right buttons for other tasks.

## Learn more about ESPHome

If you want to learn more about ESPHome, read my book [Getting Started with ESPHome: Develop your own custom home automation devices](https://koen.vervloesem.eu/books/getting-started-with-esphome/) and the accompanying GitHub repository [koenvervloesem/Getting-Started-with-ESPHome](https://github.com/koenvervloesem/Getting-Started-with-ESPHome/).

## License

This project is provided by [Koen Vervloesem](mailto:koen@vervloesem.eu) as open source software with the MIT license. See the [LICENSE](LICENSE) file for more information.

The included Roboto font is licensed under the [Apache License, Version 2.0](https://fonts.google.com/specimen/Roboto#license).

The uFire_SHT20 library is licensed under the MIT license.

The C++/runtime codebase of the ESPHome project (file extensions .c, .cpp, .h, .hpp, .tcc, .ino) are published under the GPLv3 license. The Python codebase and all other parts of the ESPHome codebase are published under the MIT license. See the [ESPHome License](https://github.com/esphome/esphome/blob/dev/LICENSE) for more information.
