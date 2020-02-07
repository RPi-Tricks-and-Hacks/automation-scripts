# automation-scripts

## install.sh - освнойной скрипт по работе с новым образом Raspbian Buster
Сначала идет опросник что сделать (удалить ли ненужное ПО, делать ли update/upgrade, устанавливать ли Docker, samba, Node и т.д.

Если выбрана очистка от ненужного ПО, то автоматом запустит скрипт по удалению uninstall.sh
```
  git clone --depth=1 https://github.com/RPi-Tricks-and-Hacks/automation-scripts.git
  cd automation-scripts
  sudo chmod +x uninstall.sh
  sudo chmod +x install.sh
  sudo ./install.sh
```
## uninstall.sh - очистка образа Raspbian Buster от ненужных пакетов
```
  git clone --depth=1 https://github.com/RPi-Tricks-and-Hacks/automation-scripts.git
  cd automation-scripts
  sudo chmod +x uninstall.sh
  sudo ./uninstall.sh
```

