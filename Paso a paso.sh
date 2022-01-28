sudo pacman -S bspwm sxhkd nitrogen alacritty arandr picom neofetch htop 

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si


mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

cd /usr/share/doc/bspwm/
cp examples/bspwmrc ~/.config/bspwm/
chmod +x ~/.config/bspwm/bspwmrc 
cp examples/sxhkdrc ~/.config/sxhkd/

cp ~/Documentos/entorno/sxhkdrc ~/.config/sxhkd/
mkdir ~/.config/bspwm/scripts/
cp ~/Documentos/entorno/bspwm_resize ~/.config/bspwm/scripts/bspwm_resize
chmod +x ~/.config/bspwm/scripts/bspwm_resize

sudo pacman -S git

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S polybar
mkdir .config/polybar 
cp /usr/share/doc/polybar/config ~/.config/polybar 
cp ~/Documentos/entorno/launch.sh ~/.config/polybar 

sudo pacman -Sy rofi

sudo reboot 

#agregar < xsetroot -cursor_name left_ptr & >
#        < $HOME/.config/polybar/launch.sh
nano .config/bspwm/bspwmrc 








usermod --shell /usr/bin/zsh hmt
usermod --shell /usr/bin/zsh root

chown hmt:hmt /root
chown hmt:hmt /root/.cache -R
chown hmt:hmt /root/.local -R

yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

pacman -S bat
pacman -S lsd







