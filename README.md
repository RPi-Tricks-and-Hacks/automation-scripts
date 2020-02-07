# Скрипты автоматизации рутинных задач

## install.sh - освнойной скрипт по работе с новым образом Raspbian Buster
Сначала идет опросник что сделать (удалить ли ненужное ПО, делать ли update/upgrade, устанавливать ли Docker, samba, Node и т.д.

Если выбрана очистка от ненужного ПО, то автоматом запустит скрипт по удалению uninstall.sh
```js
  git clone --depth=1 https://github.com/RPi-Tricks-and-Hacks/automation-scripts.git
  cd automation-scripts
  sudo chmod +x uninstall.sh
  sudo chmod +x install.sh
  sudo ./install.sh
```
## uninstall.sh - очистка образа Raspbian Buster от ненужных пакетов
```js
  git clone --depth=1 https://github.com/RPi-Tricks-and-Hacks/automation-scripts.git
  cd automation-scripts
  sudo chmod +x uninstall.sh
  sudo ./uninstall.sh
```

# Полезные команды
Вывод всех установленных пакетов отсортированных по размеру
```js
dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -nr | more
```
Вывод всех опциональных, дополнительных  пакетов (за исключением обязательных, критичных, важных), сортировка по размеру
```js
dpkg-query -Wf '${Installed-Size}\t${Package}\t${Priority}\n' | egrep '\s(optional|extra)' | cut -f 1,2 | sort -nr | less
```

#### Удалить GCC
Сначала смотрим что установлено из GCC:
```js
dpkg --get-selections | grep gcc \-
```
Далее удаляем все за исключением самого свежего по примеру следующей команды:
```js
sudo aptitude purge -y gcc-4.6-base:armhf gcc-4.7-base:armhf gcc-4.8-base:armhf gcc-4.9-base:armhf gcc-5-base:armhf
```
