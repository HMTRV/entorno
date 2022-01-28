sudo pacman -S git
sudo pacman -S bspwm sxhkd nitrogen alacritty arandr picom neofetch htop 

sudo pacman -S --needed git base-devel
cd
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -si

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

cp -r ~/Documentos/entorno/bspwm ~/.config/
cp -r ~/Documentos/entorno/sxhkd ~/.config/
chmod +x ~/.config/bspwm/bspwmrc 
chmod +x ~/.config/bspwm/scripts/bspwm_resize

sudo pacman -S yay

yay -S polybar
cd 
mkdir .config/polybar 
cp /usr/share/doc/polybar/config ~/.config/polybar 
cp ~/Documentos/entorno/launch.sh ~/.config/polybar 
echo '~/.config/polybar/./launch.sh' >> ~/.config/bspwm/bspwmrc 


sudo pacman -Sy rofi

sudo su 
usermod --shell /usr/bin/zsh hmt
usermod --shell /usr/bin/zsh root
chown hmt:hmt /root
chown hmt:hmt /root/.cache -R
chown hmt:hmt /root/.local -R

sudo su
cd 
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


su hmt
cd
yay -S --noconfirm zsh-theme-powerlevel10k-git
echo 'source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc


pacman -S bat
pacman -S lsd
cd /home/hmt/Documentos/entorno 
sudo cp  .zshrc /home/hmt /root
sudo cp  .zshrc /root









