#!/bin/bash

# Función para imprimir logs
log() {
    echo "[INSTALLER] $1"
}

# Comprobar si existe la carpeta ~/.config/bspwm y crearla si no existe
if [ ! -d ~/.config/bspwm ]; then
    mkdir -p ~/.config/bspwm
    log "Carpeta ~/.config/bspwm creada"
else
    log "La carpeta ~/.config/bspwm ya existe"
fi

# Comprobar si existe la carpeta ~/.config/sxhkd y crearla si no existe
if [ ! -d ~/.config/sxhkd ]; then
    mkdir -p ~/.config/sxhkd
    log "Carpeta ~/.config/sxhkd creada"
else
    log "La carpeta ~/.config/sxhkd ya existe"
fi

# Comprobar si existe la carpeta ~/.config/polybar y crearla si no existe
if [ ! -d ~/.config/polybar ]; then
    mkdir -p ~/.config/polybar
    log "Carpeta ~/.config/polybar creada"
else
    log "La carpeta ~/.config/polybar ya existe"
fi
log "Clonando mi configuración de Polybar..."
git clone https://github.com/miusuario/polybar-config.git ~/.config/polybar

# 1. Instalar Pyenv
log "Instalando Pyenv..." 
curl https://pyenv.run | bash
echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init --path)"' >> ~/.zshrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
source ~/.zshrc
pyenv install 3.10.0
pyenv global 3.10.0

# 2. Crear archivo requirements.txt
log "Creando archivo requirements.txt..."
touch ~/requirements.txt
echo "dotenv" >> ~/requirements.txt
echo "awswrangler" >> ~/requirements.txt
echo "pandas" >> ~/requirements.txt
echo "pyspark" >> ~/requirements.txt
echo "boto3" >> ~/requirements.txt

# 3. Instalar Node.js y Nodemon
log "Instalando Node.js y Nodemon..."
sudo pacman -S nodejs npm
npm install -g nodemon

# 4. Instalar librerías base para desarrollo en Python y C
log "Instalando librerías base para desarrollo en Python y C..."
sudo pacman -S base-devel gcc gdb make python-pip
pip install --user virtualenv

# 5. Instalar AWS CLI v2
log "Instalando AWS CLI v2..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# 6. Instalar Powerlevel10k
log "Instalando Powerlevel10k..."
if [[ ! -d ~/.oh-my-zsh/themes/powerlevel10k ]]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/themes/powerlevel10k
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
    echo 'POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(aws battery time)' >> ~/.zshrc
    echo 'source ~/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
fi

# 7. Configurar Powerlevel10k para mostrar cuenta de AWS
log "Configurando Powerlevel10k para mostrar cuenta de AWS..."
if [[ ! -f ~/.p10k.zsh ]]; then
    touch ~/.p10k.zsh
fi
echo 'typeset -g POWERLEVEL9K_CUSTOM_AWS="aws-vault exec --json default 2>/dev/null | jq -r .Profile"' >> ~/.p10k.zsh
echo 'typeset -g POWERLEVEL9K_CUSTOM_AWS_BACKGROUND="237"' >> ~/.p10k.zsh
echo 'typeset -g POWERLEVEL9K_CUSTOM_AWS_FOREGROUND="253"' >> ~/.p10k.zsh
echo 'typeset -g POWERLEVEL9K_CUSTOM_AWS_SYMBOL="  "' >> ~/.p10k.zsh
echo 'POWERLEVEL9K_CUSTOM_AWS_DEFAULT=true' >> ~/.p10k.zsh

# 8. Descargar e instalar Bspwm y dependencias
log "Descargando e instalando Bspwm y dependencias..."
sudo pacman -S bspwm sxhkd alacritty rxvt-unicode picom nitrogen feh dunst rofi

# 9. Descargar e instalar Polybar
log "Descargando e instalando Polybar..."
if [[ ! -d ~/polybar ]]; then
    git clone https://aur.archlinux.org/polybar.git ~/polybar
    cd ~/polybar
    makepkg -si
    cd ~/
fi

# 10. Descargar e instalar Oh My Zsh
log "Descargando e instalando Oh My Zsh..."
if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 11. Configurar el archivo de inicio de sesión
log "Configurando el archivo de inicio de sesión..."
if [[ ! -f ~/.xinitrc ]]; then
    touch ~/.xinitrc
fi
echo "sxhkd &" >> ~/.xinitrc
echo "exec bspwm" >> ~/.xinitrc

# 12. Configurar el archivo de configuración de Polybar
log "Configurando el archivo de configuración de Polybar..."
if [[ ! -d ~/.config/polybar ]]; then
    mkdir -p ~/.config/polybar
fi
touch ~/.config/polybar/config
echo "[global/wm]" >> ~/.config/polybar/config
echo "monitor1 = ${env:MONITOR}" >> ~/.config/polybar/config
echo "[bar/top]" >> ~/.config/polybar/config
echo "modules-left = xwindow" >> ~/.config/polybar/config
echo "modules-center = date" >> ~/.config/polybar/config
echo "modules-right = powermenu volume brightness workspace keyboard layout" >> ~/.config/polybar/config
echo "tray-position = right" >> ~/.config/polybar/config
echo "tray-padding = 2" >> ~/.config/polybar/config
echo "tray-background = #282c34" >> ~/.config/polybar/config
echo "tray-border = #282c34" >> ~/.config/polybar/config
echo "background = #282c34" >> ~/.config/polybar/config
echo "foreground = #dcdfe4" >> ~/.config/polybar/config
echo "font-0 = SauceCodePro Nerd Font Mono:size=10;0" >> ~/.config/polybar/config
echo "font-1 = SauceCodePro Nerd Font Mono:size=10;1" >> ~/.config/polybar/config
echo "font-2 = FontAwesome:size=10;0" >> ~/.config/polybar/config

# 13. Descargar e instalar Hack Nerd Font
log "Descargando e instalando Hack Nerd Font..."
if [[ ! -d ~/hack-font ]]; then
    git clone https://aur.archlinux.org/ttf-hack.git ~/hack-font
    cd ~/hack-font
    makepkg -si
    cd ~/
fi

# 14. Descargar e instalar Bspwm y dependencias
log "Descargando e instalando Bspwm y dependencias..."
sudo pacman -S bspwm sxhkd alacritty rxvt-unicode feh rofi compton

# 15. Clonar mi configuración de Bspwm
log "Clonando mi configuración de Bspwm..."
git clone https://github.com/miusuario/bspwm-config.git ~/.config/bspwm

# 16. Clonar mi configuración de Sxhkd
log "Clonando mi configuración de Sxhkd..."
git clone https://github.com/miusuario/sxhkd-config.git ~/.config/sxhkd

# 17. Configurar Alacritty
log "Configurando Alacritty..."
if [[ ! -d ~/.config/alacritty ]]; then
    mkdir ~/.config/alacritty
fi
cp ~/.config/bspwm/alacritty.yml ~/.config/alacritty/alacritty.yml

# 18. Configurar Rofi
log "Configurando Rofi..."
if [[ ! -d ~/.config/rofi ]]; then
    mkdir ~/.config/rofi
fi
cp ~/.config/bspwm/rofi.rasi ~/.config/rofi/config.rasi

# 19. Configurar Compton
log "Configurando Compton..."
if [[ ! -d ~/.config/compton ]]; then
    mkdir ~/.config/compton
fi
cp ~/.config/bspwm/compton.conf ~/.config/compton/compton.conf


# 1. Descargar Visual Studio Code
log "Descargando Visual Studio Code..."
wget -qO- https://aur.archlinux.org/cgit/aur.git/snapshot/visual-studio-code-bin.tar.gz | tar zx
cd visual-studio-code-bin/
makepkg -sirc
cd ..
rm -rf visual-studio-code-bin/

# 2. Instalar GitHub Desktop
log "Instalando GitHub Desktop..."
sudo pacman -S github-desktop

# Finalizar script
log "¡Instalación completa!"

sudo reboot