sudo pacman -S git
sudo pacman -S bspwm sxhkd nitrogen alacritty arandr picom neofetch htop 

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si

git clone https://github.com/hamttaro09/entorno.git

cp /Documentos/entorno/bspwm ~/.config/bspwm
cp /Documentos/entorno/sxhkd ~/.config/sxhkd
chmod +x ~/.config/bspwm/bspwmrc 
chmod +x ~/.config/bspwm/scripts/bspwm_resize

sudo pacman -S yay

yay -S polybar
mkdir .config/polybar 
cp /usr/share/doc/polybar/config ~/.config/polybar 
cp ~/Documentos/entorno/launch.sh ~/.config/polybar 
echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc 


sudo pacman -Sy rofi

sudo reboot 

usermod --shell /usr/bin/zsh hmt
usermod --shell /usr/bin/zsh root
chown hmt:hmt /root
chown hmt:hmt /root/.cache -R
chown hmt:hmt /root/.local -R

sudo su && cd 
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
cd /home/hmt/Documentos/entorno 
sudo cp .zshrc /home/hmt /root


pacman -S bat
pacman -S lsd

su hmt 
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc








