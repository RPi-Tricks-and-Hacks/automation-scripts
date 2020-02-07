# / Bin / bash

logdir = "$(cd" $(dirname "${BASH_SOURCE [0]} \ n") "> / dev / null 2> & 1 && pwd)"
logfile = $logdir / install.log
normal = $(echo "\ 033 [m")
boldRed = $(echo "\ 033 [01; 31m") #bold Red
boldGreen = $(echo "\ 033 [01; 92m") #bold Green
green = $(echo "\ 033 [32m") #Green
boldBlue = $(echo "\ 033 [01; 36m") #bold Blue
blue = $(echo "\ 033 [00; 36m") #Blue
titleBlue = $(echo "\ 033 [01; 96m") #bold Blue
yellow = $(echo "\ 033 [00; 33m") #Yellow

echo ''
printf "${titleBlue} СКРИПТ УСТАНОВКИ ЗАПУЩЕН ... ${normal} \ n" | tee -a $logfile
echo ''

printf "${yellow} 1. ${blue} Удалить необязательные пакеты на Raspberry? (Y / n)? ${normal}" | tee -a $logfile
    choiceDelUnnecessaryApp = n
    read choiceDelUnnecessaryApp

printf "${yellow} 2. ${blue} Установить обновления всех пакетов на Raspberry? (Y / n)? ${normal}"
    choiceInstRaspbUpdates = y
    read choiceInstRaspbUpdates

printf "${yellow} 3. ${blue} Установить Docker? (Y / n)? ${normal}"
    choiceInstDocker = y
    read choiceInstDocker

printf "${yellow} 4. ${blue} Установить сервер Samba? (Y / n)? ${normal}"
    choiceInstSamba = y
    read choiceInstSamba

printf "${yellow} 5. ${blue} Установить NodeJS? (Y / n)? ${normal}"
    choiceInstNodeJS = y
    read choiceInstNodeJS

printf "${yellow} 6. ${blue} Скачать docker контейнер MQTT брокера Eclipse-Mosquitto? (Y / n)? ${normal}"
    choiceInstMosquitto = y
    read choiceInstMosquitto

printf "${yellow} 7. ${blue} Установить сервис PM2? (Y / n)? ${normal}"
    choiceInstPM2 = y
    read choiceInstPM2

printf "${yellow} 8. ${blue} Отключить скринсейвер? (Y / n)? ${normal}"
    choiceDisableScreensaver = y
    read choiceDisableScreensaver

printf "${yellow} 10. ${blue} Отключить заставку включения и 4 клубники при включении? (Y / n)? ${normal}"
    choiceDisableBerries = y
    read choiceDisableBerries

printf "${yellow} 18. ${blue} Установить пакеты: jsonschema, paho-mqtt и rpi_ws281x? (Y / n)? ${normal}"
    choiceCloneAndInstallPackages = y
    read choiceCloneAndInstallPackages
    echo ''

# Uninstall unnecessary apps on raspberry
if [[$choiceDelUnnecessaryApp = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Удаляю необязательно ПО ${normal} \ n"
    sudo /home/pi/smsetup/uninstall.sh
    printf "${boldGreen} Дополнительное ПО удалено ${normal} \ n"
    echo ''
fi

# Install updates to raspberry
if [[$choiceInstRaspbUpdates = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Установка обновлений Raspbian ${normal} \ n"
    sudo apt update -y
    sudo apt upgrade -y
    sudo apt-get clean -y
    sudo apt-get autoremove -y
    printf "${boldGreen} Обновления Raspbian установлены ${normal} \ n"
    echo ''
fi

# Install docker
if [[$choiceInstDocker = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Устанавливаю Docker ${normal} \ n"
    curl -sSL https://get.docker.com | sh
    sudo usermod -aG docker pi
    printf "${boldGreen} Docker установлен ${normal} \ n"
    echo ''
fi

# Install samba
if [[$choiceInstSamba = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Устанавливаю SAMBA SERVER ${normal} \ n"
    printf "${green} Устанавливаю пакет SAMBA ${normal} \ n"
    sudo apt-get install -y samba samba-common-bin
    printf "${green} Пакет успешно установлен ${normal} \ n"
    printf "${green} Копирую настройки ${blue} /home/pi/smsetup/files/smb.conf >> / etc / samba ${normal} \ n"
    sudo rm /etc/samba/smb.conf
    sudo cp /home/pi/smsetup/files/smb.conf / etc / samba
    #sudo smbpasswd -a pi
    printf "${green} Запускаю Samba сервис ${normal} \ n"
    sudo systemctl restart smbd
    printf "${boldGreen} Установка SAMBA успешно завершена ${normal} \ n"
    echo ''
fi

# Install NodeJS
if [[$choiceInstNodeJS = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Устанавливаю Nodejs ${normal} \ n"
    curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
    sudo apt-get install -y nodejs
    printf "${boldGreen} Nodejs установлено ${normal} \ n"
    echo ''
fi

#mosquitto
if [[$choiceInstMosquitto = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Загружаю докер-контейнер Eclipse-Mosquitto ${normal} \ n"
    sudo docker pull eclipse-mosquitto
    printf "${boldGreen} Контейнер Eclipse-Mosquitto загружены ${normal} \ n"
    echo ''
fi

# Pm2 install
if [[$choiceInstPM2 = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Устанавливаю pm2 ${normal} \ n"
    sudo npm install -g pm2
    pm2 startup
    printf "${boldGreen} pm2 установлено ${normal} \ n"
    echo ''
fi

# Disable screensaver
if [[$choiceDisableScreensaver = ~ ^ [Yy] $]]; then
    printf "${boldGreen} Отключаю скринсейвер ${normal} \ n"
    bash /home/pi/smsetup/screensaveroff.sh
    printf "${boldGreen} Скринсейвер отключен ${normal} \ n"
    echo ''
fi


# Disable splash screen and 4 raspberries
if [[$choiceDisableBerries = ~ ^ [Yy] $]]; then
printf "${boldGreen} Отключаю отображение цветного экрана и клубники при включении ${normal} \ n"
    sudo su -c "echo disable_splash = 1 >> /boot/config.txt"
    sudo su -c "echo logo.nologo >> /boot/cmdline.txt"
    printf "${boldGreen} Отображение цветного экрана и клубники при включении выключено ${normal} \ n"
    echo ''
fi

# Install Python packages (to SUDO)
if [[$choiceCloneAndInstallPackages = ~ ^ [Yy] $]]; then
printf "${boldGreen} Устанавливаю пакеты ${blue} jsonschema ${boldGreen}, ${blue} paho-mqtt ${boldGreen} и ${blue} rpi_ws281x ${normal} \ n"
    pip install jsonschema
    sudo pip install paho-mqtt
    sudo pip install rpi_ws281x
    printf "${boldGreen} Пакеты ${blue} jsonschema ${boldGreen}, ${blue} paho-mqtt ${boldGreen} и ${blue} rpi_ws281x ${boldGreen} установлено ${normal} \ n"
    echo ''
fi


#use rpi_background.jpg as background picture