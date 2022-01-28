sudo pacman -S git
sudo pacman -S bspwm sxhkd nitrogen alacritty arandr picom neofetch htop 

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si


cp /Documentos/bspwm ~/.config/bspwm
cp /Documentos/sxhkd ~/.config/sxhkd


chmod +x ~/.config/bspwm/bspwmrc 
chmod +x ~/.config/bspwm/scripts/bspwm_resize

sudo pacman -S git

sudo pacman -S yay



yay -S polybar
mkdir .config/polybar 
cp /usr/share/doc/polybar/config ~/.config/polybar 
cp ~/Documentos/entorno/launch.sh ~/.config/polybar 
echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc 


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
cd entorno 
cp .zshrc /home/hmt


pacman -S bat
pacman -S lsd
pamac build nerd-font-complete

su hmt 
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc








