#!/bin/bash

cd /tmp/
add-apt-repository ppa:ondrej/php -y
apt update
apt install php7.2 php7.2-fpm -y
systemctl status php7.2-fpm

wget "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz" \
-O "ioncube_loaders_lin_x86-64.tar.gz"
tar -xzf ioncube_loaders_lin_x86-64.tar.gz
mv ioncube /opt/
echo "zend_extension = /opt/ioncube/ioncube_loader_lin_7.2.so" > /etc/php/7.2/cli/conf.d/00-ioncube.ini
echo "zend_extension = /opt/ioncube/ioncube_loader_lin_7.2.so" > /etc/php/7.2/fpm/conf.d/00-ioncube.ini
systemctl restart php7.2-fpm

apt install linux-headers-$(uname -r) -y

wget "https://downloads.arduino.cc/arduino-cli/arduino-cli_0.9.0_Linux_64bit.tar.gz" \
-O "arduino-cli_Linux_64bit.tar.gz"
tar -xzf arduino-cli_Linux_64bit.tar.gz
rm -rf /usr/local/bin/arduino-cli
mv /tmp/arduino-cli /usr/local/bin/arduino-cli
arduino-cli core update-index
arduino-cli config init
mv /root/.arduino15/arduino-cli.yaml /root/.arduino15/arduino-cli.yaml.bk
cat > /root/.arduino15/arduino-cli.yaml <<EOL
proxy_type: auto
sketchbook_path: /root/Arduino
arduino_data: /root/.arduino15
board_manager:
  additional_urls:
    - http://arduino.esp8266.com/stable/package_esp8266com_index.json
EOL
arduino-cli core update-index
arduino-cli core install esp8266:esp8266
arduino-cli core install esp8266:esp8266
arduino-cli core install esp8266:esp8266
arduino-cli core install esp8266:esp8266
arduino-cli core install esp8266:esp8266
arduino-cli core install esp8266:esp8266
mkdir -p /root/Arduino/libraries/

mv /usr/bin/python /usr/bin/python.old
rm /usr/bin/python
ln -s /usr/bin/python3 /usr/bin/python

apt install git -y
rm -rf /opt/sisko-alita
cd /tmp && \
git clone https://github.com/aefw/sisko-alita.git /opt/sisko-alita
rm -rf /root/Arduino/libraries/
mv /opt/sisko-alita/libraries /root/Arduino/
