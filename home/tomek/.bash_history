sudo -s
iw
iw dev
cd /media/usb0/
ls
ll
ls -la
sudo dpkg -i *.deb
sudo -s
iw --help
sudo -s
cd /media/usb0/
ls
mc
cd ~/
ls
mkdir firmware
cp /media/usb0/firmware.tar.gz firmware/
cd firmware/
ls
tar -xvf firmware.tar.gz 
ls
sudo dpkg -i firmware-realtek_0.42_all.deb 
sudo reboot 
iw dev
sudo -s
cd ~/firmware/
ll
ls -la
du -sh .
sudo dpkg -i *.deb
sudo reboot 
sudo -s
cd ~
ls
pwd
apt-get update && apt-get dist-upgrade 
apt-get --purge autoclean 
apt-get autoclean 
apt-get --purge autoremove 
apt-cache show iceweasel 
apt-cache search iceweasel
apt-cache policy iceweasel 
apt-cache search esr
dpkg-reconfigure ping -c3 google.pl
ping -c3 google.pl
cd /etc/network/
ls
ls -lha
iw wlan0
iw wlan0 info
cd
dpkg --get-selections | grep vi
apt-cache search gvim
cd /etc/apt/
ls
cp sources.list{,~}
vi sources.list
apt-get update 
apt-get dist-upgrade 
apt-cache search gvim
apt-get install vim-gtk
apt-get --purge autoremove 
apt-get --purge autoclean
apt-get autoclean
# apt-get install xscreensaver-data-extra xscreensaver-screensaver-bsod xfonts-terminus xdg-user-dirs usb-modeswitch unar ttf-dejavu tree tint2 tk tcl suckless-tools screen samba-common samba-common-bin samba-libs pulseaudio pulseaudio-utils pulseaudio-module-x11 pidgin poppler-data openvpn ntfs-3g
vim /etc/adjtime 
vim /etc/default/rcS 
sed -i -e 's:^UTC$:LOCAL:' /etc/adjtime
vim /etc/adjtime 
dpkg-reconfigure tzdata
cat /etc/timezone 
ls /etc/localtime 
ls -ln /etc/localtime 
ls -l /etc/localtime 
less /etc/localtime 
apt-get install xscreensaver-data-extra xscreensaver-screensaver-bsod xfonts-terminus xdg-user-dirs usb-modeswitch unar ttf-dejavu tree tint2 tk tcl suckless-tools screen samba-common samba-common-bin samba-libs pulseaudio pulseaudio-utils pulseaudio-module-x11 pidgin poppler-data openvpn ntfs-3g nodejs npm network-manager-openvpn-gnome murrine-themes mousetweaks mobile-broadband-provider-info menu mc build-essential hdparm gtk2-engines gtk2-engines-murrine gtk2-engines-pixbuf git gitk ghostscript gdebi gconf-editor dconf-editor fonts-droid fonts-liberation flashplugin-nonfree feh evince default-jre cups-common cups-pk-helper ca-certificates-java ack-grep audacious
# apt-get install xscreensaver-data-extra xscreensaver-screensaver-bsod xfonts-terminus xdg-user-dirs usb-modeswitch unar ttf-dejavu tree tint2 tk tcl suckless-tools screen samba-common samba-common-bin samba-libs pulseaudio pulseaudio-utils pulseaudio-module-x11 pidgin poppler-data openvpn ntfs-3g nodejs npm network-manager-openvpn-gnome murrine-themes mousetweaks mobile-broadband-provider-info menu mc build-essential hdparm gtk2-engines gtk2-engines-murrine gtk2-engines-pixbuf git gitk ghostscript gdebi gconf-editor dconf-editor fonts-droid fonts-liberation flashplugin-nonfree feh evince default-jre cups-common cups-pk-helper ca-certificates-java ack-grep audacious
apt-get install xscreensaver-data-extra xscreensaver-screensaver-bsod xdg-user-dirs unar tree tint2 suckless-tools screen ntfs-3g ack-grep hdparm feh mc menu
apt-get install build-essential openvpn network-manager-openvpn-gnome nodejs npm git gitk
apt-get install ttf-dejavu xfonts-terminus fonts-droid fonts-liberation
apt-get install pidgin audacious evince flashplugin-nonfree
apt-get install murrine-themes gtk2-engines gtk2-engines-murrine gtk2-engines-pixbuf
apt-get install pulseaudio pulseaudio-utils pulseaudio-module-x11 ghostscript gdebi gconf-editor dconf-editor
apt-get install pulseaudio pulseaudio-utils pulseaudio-module-x11 ghostscript gdebi dconf-editor
apt-get install usb-modeswitch
apt-get install make
dpkg --get-selections | grep xmms
apt-get --purge remove xmms2-core 
apt-get --purge remove xmms2-core lxmusic 
apt-get --purge autoremove 
dpkg --get-selections | grep guile
apt-get install guile
apt-get install guile2.0
apt-get install guile-2.0
apt-get --purge autoremove 
apt-get install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
apt-get install nvidia-kernel-dkms nvidia-glx build-essential nvidia-settings nvidia-xconfig
nvidia-xconfig 
cd /etc/X11/
ls
mkdir xorg.conf.d
mv xorg.conf xorg.conf.d/20-nvidia.conf
rm xorg.conf.nvidia-xconfig-original 
vim xorg.conf.d/20-nvidia.conf 
sudo -s
dpkg --get-selections | grep firmware
less /var/log/apt/history.log 
sudo -s
sudo -h
sudo -E -s
synaptic-pkexec 
cd ~/Downloads/
ll
ls
ls -la
dpkg --get-selections > local.selections
# dpkg --get-selections > local.selections
vimdiff *.selections
vim debian.selections 
vim local.selections 
vimdiff *.selections
vim
apt-cache show usb-modeswitch
apt-cache show ethtool 
sudo -s
xdg-user-dirs
xdg-user-dir
xdg-user-dirs-update 
cd ~
ll
ls
ls -lha
cd Downloads/
ls
vimdiff *.selections
apt-cache search freetype
dpkg --get-selections | grep free
dpkg --get-selections > local.selections 
vimdiff *.selections
uname -r|sed 's,[^-]*-[^-]*-,,'
dpkg --get-selections | grep tint
less /etc/fstab
sudo reboot 
ls
ll
cd ~/Downloads/
ls
dpkg --get-selections > local.selections 
vim local.selections
ll
ls
ls -lha
mc
audacious 
cd ~/.config/autostart/
ls
ll
vim at-spi-dbus-bus.desktop 
ll
sudo -s
lxappearance 
vim ~/.gtkrc-2.0 
lxappearance 
gvim
vim ~/.gtkrc-2.0 
cd ~/Downloads/
ls
mc
obconf 
vim ~/.gtkrc-2.0 
apt-cache search gtk-chtheme
sudo apt-get install gtk-chtheme 
mv ~/.gtkrc-2.0
sudo apt-get install gtk-chtheme 
vim ~/.gtkrc-2.0 
mv ~/.gtkrc-2.0{,.mine}
gtk-chtheme 
vim ~/.gtkrc-2.0
mv .gtkrc-2.0.mine .gtkrc-2.0
rm .gtkrc.bak 
lxappearance 
ll
ls
ls -lha
sudo apt-get --purge remove gtk-chtheme 
tint2 &
cd
vimdiff tint2rc ~/Downloads/home/tomek/.config/tint2/tint2rc 
mv tint2rc{,.bak}
ll
ls
ls -la
vimdiff *
xrdb ~/.Xresources 
ls
ll
ls -lha
mc
less ~/.xsession-errors
cd ~/.config/au
cd ~/.config/autostart/
ls
ps aux | grep at-spi
vim at-spi-dbus-bus.desktop 
ll
ls
mc
cd
apt-get install cd
ps aux | grep polkit
cd /etc/xdg/autostart/
ls
ls -la
sudo -E -s
cd ~/Downloads/
ls
ll
ls -la
vimdiff local.selections lubuntu.selections 
vim lubuntu.selections 
vimdiff local.selections lubuntu.selections 
mc
ls
vim ~/.Xresources 
xrdb ~/.Xresources 
ls
feh --bg-scale /usr/share/wallpapers/joy/contents/images/1920x1200.png 
cd
mc
cd /etc/fonts/conf.d/
ls
ll
ls -la
ls
ls -la
cd ./.
ls
ls -l
cd ../
l
ls
less fonts.conf 
cd conf.avail/
ls
ls -la
apt-cache search 10-antialias.conf
apt-cache search libcairo2
dpkg --get-selections | grep libcairo2
dpkg --get-selections | grep font
cd ~/Downloads/
ls
gvimdiff local.selections mint.selections 
ll
cd -
ls
dpkg -S 20-unhint-small-dejavu-
dpkg -S 10-antialias.conf
sudo apt-get install fontconfig libcairo2 libdirectfb libfreetype6 libxft2
apt-get install fontconfig-config
sudo apt-get install fontconfig-config
sudo update-alternatives --config x-terminal-emulator 
sudo update-alternatives --config x-cursor-theme 
sudo update-alternatives --config x-www-browser 
sudo update-alternatives --config x-session-manager 
alsamixer 
ll
ls -la
cd ~/.local/bin/
l
ls
./dmenu_run 
ll
ls -lha
mc
sudo rmmod pcspkr 
cd /etc/modprobe.d/
ls
ls -lha
vim nvidia-blacklists-nouveau.conf 
cd
ll
mc
less ~/.xsession-errors
dpkg --get-selections | grep xfce
dpkg --get-selections | grep lx
dpkg --get-selections | grep notif
nvidia-settings 
dpkg --get-selections | grep gnome
cd ~/.config/
cd openbox/
ls
ls -la
vimdiff *.xml
ls
find / -name openbox
dpkg -L openbox 
cp /etc/xdg/openbox/environment .
cp /etc/xdg/openbox/menu.xml .
cp /etc/xdg/openbox/autostart .
vimdiff /etc/xdg/openbox/rc.xml rc.xml 
ll
ls -lha
vimdiff rc.xml lxde-rc.xml 
vimdiff autostart ~/Downloads/home/tomek/.config/openbox/autostart 
ps aux | grep gnome
vimdiff autostart ~/Downloads/home/tomek/.config/openbox/autostart 
# vimdiff {,~/Downloads/home/tomek/.config/openbox/}
ls
vimdiff {,~/Downloads/home/tomek/.config/openbox/}environment
vimdiff {,~/Downloads/home/tomek/.config/openbox/}menu.xml
gvimdiff {,~/Downloads/home/tomek/.config/openbox/}menu.xml
mv ~/Downloads/home/tomek/.config/openbox/menu.xml menu.xml 
mv ~/Downloads/home/tomek/.config/openbox/rc.xml rc.xml 
vim rc.xml 
ll
ls -lha
cd
ls
cd -
ls
cd
ls
cd ~/Downloads/
ls
ls -lha
cd home/
ls
cd mint/
ls
mc
cd
vimdiff .profile ~/.profile 
vimdiff .bashrc ~/.bashrc 
vimdiff .bashrc ~/.bahr
vimdiff .bashrc ~/.bashrc 
cd ~/Downloads/
ls
ll
ls -la
cd home/
mc
rmmod pcspkr 
cd
vim ~/.screenrc 
screen
vim ~/.bash_aliases 
ll
ls -lha
rm -rf firmware/
ll
mc
exexit
cCDCDCc[1;2Cc TI@TJ#TJ
apt-up 
cd ~
cd ~/Downloads/
sl
ll
ls
ll
cd ~/.config/au
cd ~/.config/autostart/
ls
ll
rm xscreensaver.desktop 
less /usr/share/applications/xscreensaver-properties.desktop 
xscreensaver-demo 
xscreensaver
vim ~/.xscreensaver 
vim
rscreen 
screen -ls
screen -h
ps aux | grep scre
screen -wipe
ps aux | grep scre
pkill screen 
ps aux
ps aux | grep screen
ps aux | grep mc
xo
cd
screen
cd ~
s
ls
sudo reboot 
cd ~/.config/autostart/
ls
cp /usr/share/applications/xscreensaver-properties.desktop .
cp xscreensaver{-properties,}.desktop 
vim xscreensaver.desktop 
rm xscreensaver-properties.desktop 
sudo rmmod pcspkr 
vim xscreensaver.desktop ~/.config/autostart/xscreensaver.desktop 
vim ~/.Xresources 
xscreensaver-demo 
cd ~/Downloads/
ls
mc
htop
top
vimdiff ~/.screenrc /etc/screenrc 
vim ~/.gtkrc-2.0 
apt-cache show aptdaemon
apt-cache show apt-file 
apt-cache show 
apt-cache show binfmt-support 
apt-cache show bison
apt-cache show cli-common
apt-cache show console-data 
apt-cache show diffstat 
apt-cache show dpkg-r
apt-cache show dpkg-repack 
apt-cache show dselect 
apt-cache show hardening-includes 
apt-cache show wireless-regdb 
apt-cache show qtchooser 
apt-cache show ndiswrapper-common 
cd ~/Downloads/
ls
mc
apt-up 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59
vim /etc/apt/sources.list.d/spotify
apt-get update 
cd /etc/apt/
ls
cd sources.list.d/
ls
man sources.list 
mv spotify{,.list} 
apt-get update 
apt-get install spotify-client
cd
apt-get install qt4-qtconfig 
cd
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq 
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
cd
apt-get install htop
apt-get install acpi-support acpi-fakekey apt-file binfmt-support brasero cli-common console-data command-not-found curl diffstat dmz-cursor-theme cantarell                                                                                                |       ---------------------------------------------------------------------------------------------------------------
apt-get install acpi-support acpi-fakekey apt-file binfmt-support brasero cli-common console-data command-not-found curl diffstat dmz-cursor-theme fonts-cantarell fonts-freefont-ttf genisoimage gettext gimp growisofs gtk2-engines-aurora hardening-includes hddtemp icedtea-plugin lame zip xinput xfsprogs x11proto-input-dev x11proto-kb-dev x11proto-xext-dev x11-xfs-utils wireless-regdb vlc vlc-plugin-pulse usbmuxd unrar ttf-freefont transmission-gtk strace resolvconf qtcore4-l10n p7zip locate lm-sensors gstreamer0.10-{alsa,ffmpeg,plugins-ugly,pulseaudio,tools}
apt-get install acpi-support acpi-fakekey apt-file binfmt-support brasero cli-common console-data command-not-found curl diffstat dmz-cursor-theme fonts-cantarell fonts-freefont-ttf genisoimage gettext gimp growisofs gtk2-engines-aurora hardening-includes hddtemp icedtea-plugin lame zip xinput xfsprogs x11proto-input-dev x11proto-kb-dev x11proto-xext-dev x11-xfs-utils wireless-regdb vlc vlc-plugin-pulse usbmuxd unrar ttf-freefont transmission-gtk strace resolvconf qtcore4-l10n p7zip locate lm-sensors gstreamer0.10-{alsa,plugins-ugly,pulseaudio,tools}
apt-clean 
apt-get update 
cd /usr/share/icons/
ls
ll
dpkg -S elementaryXubuntu-dark/
cd
apt-cache search zukitwo
apt-cache search zukit
apt-cache search zuki
cd ~/Downloads/
ls
ll
qtconfig
qtconfig-qt4 
cd ~/Downloads/
ls
;;
ll
vimdiff local.selections mint.selections 
apt-cache search background
apt-cache search backgrounds
apt-cache search theme
apt-cache search icon-theme
df -h
dpkg --get-selections | grep icon-theme
dpkg --get-selections | grep cursor
vim ~/.gtkrc-2.0 
cd ~/.icons/
ls
ll
cd default/
ls
vim index.theme 
cd ../
ll
rm -rf default/
ln -s /usr/share/icons/DMZ-White/ default
ll
less default/cursor
less default/cursor.theme 
cd
screen
cd ~/Pictures/
mv ~/Downloads/wallpaper-1* .
mv ~/Downloads/MV.png .
cd
feh --bg-scale ~/Pictures/MV.png 
feh --bg-scale ~/Pictures/wallpaper-1641898.jpg 
feh --bg-scale ~/Pictures/wallpaper-1950578.jpg 
feh --bg-scale ~/Pictures/MV.png 
cd ~/Downloads/
ls
ll
ls *.deb
sudo dpkg -i *.deb
sudo apt-get install *.deb
ls
ll
sudo apt-get install gtk3-engines-unico
sudo apt-cache search install gtk3-engines
apt-cache search install gtk3-engines
apt-cache search gtk3-engines
dpkg --get-selections | grep icon-theme
lxappearance
less ~/.gtkrc-2.0 
lxappearance 
dpkg --get-selections | grep icon
# sudo apt-get --purge remove faience-*
lxappearance 
less ~/.xsession
less ~/.xsession-errors
feh --bg-scale ~/Pictures/wallpaper-1641898.jpg 
feh --bg-scale ~/Pictures/wallpaper-1950578.jpg 
vim ~/.gtkrc-2.0 
exit
dpkg --get-selections | grep ^lx
gksu-properties 
gksudo 
apt-clean 
cd ~/Downloads/
ls
l
ll
apt-get --purge remove lxterminal lxtask lxshortcut lxpanel lxmenu-data lxlauncher lxde-icon-theme 
apt-get --purge remove lxterminal lxtask lxshortcut lxmenu-data lxlauncher lxde-icon-theme 
# apt-get --purge remove lxterminal lxtask lxshortcut lxmenu-data lxlauncher lxde-icon-theme 
apt-get --purge remove lxterminal lxtask
apt-get --purge remove lxshortcut 
apt-get --purge remove lxlauncher 
apt-get --purge remove lxde-icon-theme 
apt-clean 
apt-get install hyphen-en-us liblightdm-gobject-1-0 libreoffice libreoffice-help-en-us libvte-common libvte9 libxklavier16 lightdm lightdm-gtk-greeter mythes-en-us
apt-clean 
apt-get update 
apt-cache search unico
apt-cache search unico | less
apt-cache search gtk-engines
apt-cache search gtk-eng
apt-cache search gtk
apt-cache search gtk | grep engine
apt-cache search gtk3-engines
ll
l
ll
df -h
qtconfig-qt4 
screen
lxappearance 
exit
lxrandr 
lxkey
lx-keyboard
cd
cd ~/Downloads/
ls
cd etc/
tree .
vimdiff apt/sources.list /etc/apt/sources.listu
vimdiff apt/sources.list /etc/apt/sources.list
vim default/grub /etc/default/grub 
vimdiff default/grub /etc/default/grub 
apt-cache search vbe
vimdiff default/grub /etc/default/grub 
update-grub
vim lightdm/lightdm.conf /etc/lightdm/lightdm.conf 
vimdiff lightdm/lightdm.conf /etc/lightdm/lightdm.conf 
vimdiff lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf 
update-command-not-found 
apt-cache search lx | grep ^lx
sudo rmmod pcspkr 
cd ~/Downloads/
ls
mc
sudo
screen
pavucontrol &
cd ~/Downloads/
wget http://mozilla.debian.net/pkg-mozilla-archive-keyring_1.0_all.deb;
cd ~
mv ~/.mozilla{,-old}
mv ~/.mozilla{-old,}/
mv ~/.mozilla{,-old}
mv ~/.mozilla{-old,}/
mv ~/.mozilla{,-old}
mv ~/.mozilla{-old,}/
volti &
cd ~/.config/au
cd ~/.config/autostart/
ls
cp /usr/share/applications/volti.desktop .
vim volti.desktop 
xfce4-notifyd-config 
less ~/.xsession-errors
> ~/.xsession-errors
less ~/.xsession-errors
cat ~/.xsession-errors
less ~/.xsession-errors
fbxkb &
ls
cd 
ls -lha
xxkb &
xxkb
man xxkb 
ll
cd ~/.config/
ll
cd
find / -name *lx*
find ~ -name *lx*
rm -rf ~/.config/lxpanel/ ~/.config/lxterminal/ ~/.cache/lxsession ~/.cache/lxsession-default-apps/
find ~ -name *lx*
rm -rf ~/.config/lxsession/
ls
ll
htop
apt-cache search pavu
apt-get install pavucontrol
dpkg --get-selections | grep firefox
dpkg --get-selections | grep ice
apt-get --purge remove iceweasel 
apt-get install iceweasel
apt-get --purge remove iceweasel 
apt-get install iceweasel
apt-get --purge remove iceweasel 
apt-cache search libffi
apt-get install iceweasel
cd
apt-get install lxappearance-obconf
apt-cache search oblogout
apt-cache search volume
apt-cache search volume | grep icon
apt-cache search pulse | grep volume
apt-get install volti
dpkg --get-selections | grep file
apt-get --purge remove xarchiver 
apt-get install file-roller 
apt-get --no-install-recommends install file-roller 
apt-get --no-install-recommends install file-roller  
dpkg --get-selections | grep notif
apt-get install xfce4-notifyd 
apt-get --no-install-recommends install xfce4-notifyd 
apt-cache search xkb
apt-cache show fbxkb 
apt-cache show xxkb 
apt-get install fbxkb
apt-get --purge remove fbxkb 
apt-get install xxkb 
apt-get --purge remove xxkb 
er
cd ~/Downloads/
ls
ll
dpkg --get-selections > local.selections 
vim local.selections 
vimdiff local.selections lubuntu.selections 
lxinput 
lxinput &
vimdiff local.selections lubuntu.selections 
screen
vim /etc/lightdm/lightdm.conf 
service lightdm restart 
sudo -s
volti &
screen
rmmod pcspkr 
dpkg --get-selections | grep vol
apt-get --purge remove volti 
apt-get install PNMixer
apt-cache search PNMixer
apt-cache search mixer
apt-cache search pnmix
apt-cache search pnmixer
apt-cache search mixer
apt-cache search mixer | less
apt-get install volti
apt-get install arj cpufrequtils gvfs-bin mobile-broadband-provider-info pavucontrol xfce4-screenshooter ttf-liberation fbxkb 
apt-get install arj cpufrequtils gvfs-bin mobile-broadband-provider-info pavucontrol ttf-liberation fbxkb 
apt-up 
cd ~/.config/autostart/
ls
ll
cd -
xrdb ~/.Xresources 
cd ~/Downloads/
ls
ll
vimdiff local.selections crunch.selections 
vim crunch.
vim crunch.selections 
gvimdiff local.selections crunch.selections 
apt-cache show gtrayicon
apt-cache show hsetroot 
apt-cache show thumbler
apt-cache show tumbler
apt-cache show user-setup
apt-cache show xdotool 
apt-cache show figlet 
fbxkb &
rm -r ~/.config/volti/
cd ~/.config/au
cd ~/.config/autostart/
l
ll
cd ~/Downloads/
mc
ps aux | grep kb
fbxkb 
fbxkb
strace fbxkb
ll
rscreen 
sudo service lightdm restart 
Restart 
fbxkb 
locale
setxkbmap -print -verbose 10
# localectl set-x11-keymap layout
localectl set-x11-keymap pl,us pc105, grp:alt_shift_toggle
ll
set-x11-keymap pl,us pc105, grp:alt_shift_toggle
rmmod pcspkr 
cd
setxkbmap -print -verbose 10
locale
cd /etc/X11/
ls
tree .
find . -name *keyboard*
find / -name *keyboard*
find / -name *keyboard.conf
vim /etc/X11/xorg.conf.d/10-keyboard.conf
screen
Restart 
cd /etc/X11/
cd xorg.conf.d/
less 10-keyboard.conf 
vim /etc/default/keyboard
dpkg-reconfigure keyboard-config
dpkg -L fbxkb 
cd /usr/share/fbxkb/images/
ls
ll
les pl.png 
apt-cache search xkb
apt-cache search xkb | grep switch
apt-get install gxkb 
les /etc/default/keyboard 
less /etc/default/keyboard 
less /etc/X11/xorg.conf.d/10-keyboard.conf 
xkb-switch
setxkbmap -model pc105 -layout pl,us -option grp:alt_shift_toggle
setxkbmap -print -verbose 10
gxkb 
setxkbmap -print -verbose 10
setxkbmap -model pc105 -layout pl,us -option grp:alt_shift_toggle
dpkg -L gxkb 
man gxkb
info gxkb
apt-get --purge remove gxkb fbxkb 
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
sudo -s
fbxkb 
strace fbxkb 
gxkb 
ьфт gxkb 
man gxkb 
gxkb --help
setxkbmap -print -verbose 10
gxkb 
Restart 
vim /etc/default/keyboard 
vim /etc/default/console-setup 
vim /etc/default/grub 
update-grub
vim /etc/default/locale 
vim /etc/default/networking 
vim /etc/default/pulseaudio 
sudo -s
cd ~/Downloads/
ls
vimdiff local.selections debian.selections | grep systemd
ps aux | grep vim
kill 4536
diff local.selections debian.selections | grep systemd
Restart 
sudo reboot 
cd ~/Downloads/
ll
dpkg --get-selections > local.selections 
vim local.selections
ls
cd crunch/
ls
ll
tree .
less etc/default/grub 
cd home/
ls
cd crunchbang/
ll
cd ../../
ll
tree .
tree -la .
mc
htop
gsimplecal 
vimdiff ~/.config/fshgyu7t7ihfhyfomot]\r6~= {
gpicview 
cd /home/tomek/Downloads/crunch/.config/
vimdiff gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini 
OA
cd ~/.config/
pwd
OA
cd
apt-cache search simplecal
yum install gsimplecal
apt-get install gsimplecal
screen
Stop 
Stop
xprop 
ls
cd ~/ bJDHGVohbn;p[[/.pofvn;'mn \
'; .�oasdpuasd9asudasd; ; ; ; ]; =; 9da; 9d; ad8; ay; das; dh; a; db; as; d ; asuk; da; sd; asd; a; cgx; c; zxcf; zx; ca; xa; ; ; ; ; ; f;  gvbn
ls
mc
vim
exit
dm-tool --help
dm-tool switch-to-greeter
vim ~/.xscreensaver 
vim ~/.config/openbox/menu.xml 
dpkg --get-selections | grep ntfs
cd ~/Downloads/
ls
mc
d
cd
blkid
sudo blkid
cd /mnt/
ls
ll
ls -lha
cd /media/
ls
ll
cd tomek/
ls
cd /mnt/
sl
groups
cd /mnt/ntfs/
ls
ll
cd c
ll
ls -lha
uid
id
gid
ll
cd
cd /media/
ls
cd /mnt/ntfs/
ls
ll
cd c
ll
cd
cd /mnt/ntfs/
ls
ll
cd c
ll
cd ../d
ls
touch dupa
vim dupa
rm dupa 
ll
touch dupa
ll
rm dupa 
ll
cd
cd ~/Downloads/
ls
ll
find . -name *spotify
cd ~
find . -name *spotify
cd .cache/
ls
cd spotify/
ls
ll
du -sh Storage/
cd
find . -name *spotify
find . -name *spotify | xargs du -h
find . -name *spotify | xargs du -sh
cd /mnt/ntfs/d/Users/Tomek/Spotify/
ls
ll
ls
ll
ls
cd ../
ls
cd Spotify/
ls
less index.dat 
cd ../
du -sh Spotify/
cd ~
ls
ll
cd Music/
ls
ln -s /mnt/ntfs/d/Users/Tomek/Music/ .
ll
rm Music
cd ../
ls
mv Music{,-old}
ln -s /mnt/ntfs/d/Users/Tomek/Music
ll
rmdir Music-old/
mv Videos{,-old}
ln -s /mnt/ntfs/d/Users/Tomek/Videos
ls /mnt/ntfs/d/Users/Tomek/
ll
rmdir Videos-old/
ls /mnt/ntfs/d/Users/Tomek/
mv Pictures{,-old}
ln -s /mnt/ntfs/d/Users/Tomek/Pictures
ls
ll
ln -s /mnt/ntfs/d/Users/Tomek/Games
ln -s /mnt/ntfs/d/Users/Tomek/Iso
ln -s /mnt/ntfs/d/Users/Tomek/Books
cd Documents/
ls
ln -s /mnt/ntfs/d/Users/Tomek/Documents
cd ../Downloads/
ln -s /mnt/ntfs/d/Users/Tomek/Downloads/
ll
rm Downloads
ln -s /mnt/ntfs/d/Users/Tomek/Downloads
ls
cd ..
ls -ln
rm Pictures-old/
rmdir Pictures-old/
rmdir Pictures-old
cd Pictures-old/
ls
cd ../Pictures
ls
cd ,,.
cd ../
rm -rf Pictures-old/
ll
h
cd ~/Downloads/
ls
ll
sudo lxappearance 
vim ~/.config/openbox/rc.xml 
/usr/lib/xscreensaver/apple2 
/usr/lib/xscreensaver/apple2 -text -program
/usr/lib/xscreensaver/apple2 -text -program bash
/usr/lib/xscreensaver/apple2 -text -program bash -mono -fast
find . -name defaults.list
less ./crunch/.local/share/applications/defaults.list
# cp ./crunch/.local/share/applications/defaults.list ~/.local/share/
mkdir ~/.local/share/applications
cp /usr/share/applications/defaults.list ~/.local/share/applications/
vim ./crunch/.local/share/applications/defaults.list ~/.local/share/applications/
vim ./crunch/.local/share/applications/defaults.list ~/.local/share/applications/defaults.list 
cd /etc/X11/xorg.conf.d/
ls
rm 10-keyboard.conf 
cd
vim /etc/lightdm/lightdm.conf 
grouplist
groups 
groupadd autologin
gpasswd -a tomek autologin
apt-cache search numlock
less /etc/environment 
vim /etc/lightdm/lightdm-gtk-greeter.conf 
apt-cache search elementary

apt-cache search mate
apt-cache search mate | grep ^mate
apt-cache search cinnamon
ps aux | grep ntp
dpkg --get-selections | grep ntp
vim /etc/fstab
lsblk 
blkid 
vim /etc/fstab
cd /mnt/
ls
mkdir tomek
cd tomek/
ls
ll
cd ../
mv tomek/ ntfs
cd ntfs/
ls
ll
mkdir {c,d}
ll
vim /etc/fstab
mount -a
vim /etc/fstab
mount -a
vim /etc/fstab
umount /mnt/ntfs/c
umount /mnt/ntfs/d
mount -a
vim /etc/fstab
cpufreq-info 
cd
er
apt-get install pip
apt-get install python-pip
cd /root/
ls
ll
ls -la
cd /usr/share/polkit-1/
ls
cd rules.d/
ls
cd ../
ls
cd actions/
ls
ll
vim com.ubuntu.pkexec.synaptic.policy 
ls
cd ../rules.d/
ls
ll
vim 60-network-manager.rules 
cd ../actions/
ls
ll
vim com.ubuntu.pkexec.synaptic.policy 
cd
cd /root/
ls
ll
cp /home/tomek/.gtkrc-2.0 .
ls
ls -la
mkdir .config
cd .config/
cp -r /home/tomek/.config/gtk-3.0/ .
ll
cd gtk-3.0/
ls
ll
vim settings.ini 
cd ./.
cd ../
ls
cd ../
ll
mkdir .icons
cd .icons/
cp /home/tomek/.icons/default .
ll
ls /home/tomek/.icons/default .
ls -ln /home/tomek/.icons/default .
ln -s /usr/share/icons/DMZ-White default
ll
cd ../
ll
tree .
vim .bashrc 
cd
sm
cd ~
pwd
dpkg -L xscreensaver-data-extra 
cd /usr/lib/xscreensaver
ls
ll
pwd
cd ../
ls
dpkg -L xscreensaver-data-extra
dpkg -L xscreensaver-data-extra | grep term
cd
apt-get install pcmanfm
apt-get --reinstall install pcmanfm
less /usr/share/application-registry/gnome-vfs.applications 
less /usr/share/applications/defaults.list 
screen
h
vim ~/.config/openbox/rc.xml 
vim ~/.config/openbox/menu.xml 
apt-cache search ffmpeg
apt-cache search compat
apt-cache search compat | less
apt-cache search libav
apt-cache search '-compat'
apt-cache search '\-compat'
apt-cache search '\-compat' | less
apt-cache search libav
apt-get install libav-tools
apt-get --purge remove libopencv-core2.4 libavfilter4 libopencv-imgproc2.4 libav-tools libavdevice54 libtbb2
apt-cache search libavutil50
apt-cache search libavutil
apt-cache search libav
apt-get install libavcodec libavutil
apt-get install libavcodec55 libavutil53
apt-get install libavcodec55 libavformat55 
apt-get install libav-tools
xprop 
cd ~/Music
ls
cd Beast
cd Beastmilk/
ll
cd Use\ Your\ Deluge/
ll
cd ../
ll
vim ~/.config/spotify/Users/1191662746-user/local-files.bnk
vim ~/.config/spotify/Users/1191662746-user/prefs 
strace spotify 
tail /var/log/apt/history.log 
vim ~/.config/openbox/rc.xml 
screen
# ssh -a tm5073@tm5073
less ~/.xsession
less ~/.xsession-errors
ssh -A tm5073@tm5073
h
cd ~/.config/
ls
ll
viewres 
vim ~/.local/share/applications/defaults.list 
vim ~/.local/share/applications/mimeapps.list 
galculator 
pkill tint2 
cd ~/Downloads/
ls
df -h
vim ~/tm5073-vpn/vpn.pl.hurra.com.conf 
vim ~/tm5073-vpn/vpn.pl.hurra.com.ovpn 
ll
cd crunch/
ls
ll
vim ~/.config/tint2/tint2rc
mc
cd
less $HOME/tm5073-vpn/ca.crt
mkdir -p ~/.local/lib/spotify
cd ~/.local/lib/spotify/
ls
ll
dpkg -L libavcodec55 
ls -ln /usr/lib/x86_64-linux-gnu/libavcodec
ls -ln /usr/lib/x86_64-linux-gnu/libavcodec*
ln -s /usr/lib/x86_64-linux-gnu/libavcodec.so.55
ll
rm libavcodec.so.55
ln -s /usr/lib/x86_64-linux-gnu/libavcodec.so.55 libavcodec.so.52
ln -s /usr/lib/x86_64-linux-gnu/libavformat.so.55 libavformat.so.52
ll
cd ~/.local/bin/
ls
vim spot
ll
chmod 755 spot 
vim ~/.profile 
echo $PATH
cd ~/.local/bin/
ls
ll
./spot 
xkill 
ll
rm spot 
cd ~/.local/lib/
ls
rm -rf spotify
cd
gsimplecal --help
gsimplecal
pkill tint2 
volumeicon 
cd ~/.config/
ls
ll
rm -rf volumeicon/
cd
cd ~/Downloads/
ll
vim ~/.Xresources 
cd ~
ll
du -sh .
du -sh *
du -sh \.*
ll
du -sh \..*
du -sh .*
du -sh ..*
du -sh ..*ll
ls
ls -lha
ls -la
ls -la | awk '{print $9}'
ls -la | awk '{print $9}' | xarg du -sh
ls -la | awk '{print $9}' | xargs du -sh
ls -la | awk '{print $9}' | xargs du 
ls -la | awk '{print $9}' | xargs du -s
ls -la | awk '{print $9}' | xargs du -h
ls -la | awk '{print $9}' | xargs du -h | grep M
sm
cd /usr/share/backgrounds/
ls
cd linuxmint-debian/
l
dpkg -L mint-backgrounds-debian
feh gelsan_debian.png 
cd
cd ~/Downloads/
ls
ll
mc
vimdiff tint2rc ~/.config/tint2/tint2rc
vim tint2rc ~/.config/tint2/tint2rc
tint2 --help
tint2 -c tint2rc 
pkill tint2 
tint2 -c tint2rc 
vim tint2rc ~/.config/tint2/tint2rc
l
rm tint2rc 
cd
cd
apt-cache search libavcodec
dpkg --get-selections | grep libavc
dpkg --get-selections | grep gstreamer0.10-plugins
dpkg --get-selections | grep lame
dpkg --get-selections | grep mp3
apt-cache search volumeicon
apt-get install volumeicon-alsa 
dpkg -L volumeicon-alsa 
apt-get --purge remove volumeicon-alsa 
cd
apt-cache show mtp-tools 
apt-cache show goatr
apt-cache show goattracker 
cd
dpkg --get-selections | grep gphoto
apt-get update 
apt-get --purge remove mint-backgrounds-debian 
less /etc/default/keyboard 
dpkg -S /etc/default/keyboard 
spotify 
apt-cache search spotify
screen
cd ~/Downloads/
ll
ls -lha
ps aux | grep gpart
pkill gpartedbin 
pkill gparted
apt-cache search plank
apt-cache search panel
apt-cache search dock
apt-cache search elementary
fdisk -l
apt-get install gparted 
vim /etc/lightdm/lightdm-gtk-greeter.conf 
cd
apt-get install xfce4-power-manager
cd /etc/xdg/autostart/
ll
cd
h
ps aux | grep gparted
cd ~/Downloads/
ls
l
ll
mc
cd /media/tomek/
ls
ll
ls -la
cd ../
ll
tree .
cd
h
man dd
# dd if=~/Downloads/elementaryos-unstable-amd64.20140408.iso 
# dd if=~/Downloads/elementaryos-unstable-amd64.20140408.iso
xfce4-power-manager
xfce4-power-manager-settings 
h
man dd
# dd bs=4M if
# less ~/Downloads/elementaryos-unstable-amd64.20140408.iso 
# less /dev/sdc
sudo dd bs=4M if=~/Downloads/elementaryos-unstable-amd64.20140408.iso of=/dev/sdc
less ~/.xsession-errors
ps aux | grep spi
screen
ll
vim menu.xml 
rm menu.xml 
ls
ll
cd ~/Downloads/
l
mc
ll
mc
cd ~/.config/tint2/
ls
cp tint2rc tint2rc.bak 
cp tint2rc.sth tint2rc
vim tint2rc
cd ~/Pictures/
gksu-properties 
gpicview .
feh --bg-scale ~/Pictures/wallpaper-1342920.jpg 
mv /Pictures/wallpaper-{1342920,debian}.jpg
mv ./Pictures/wallpaper-{1342920,debian}.jpg
gpicview ~/Pictures/wallpaper-1342920.jpg
mv ~/Pictures/wallpaper-1342920.jpg ~/Pictures/wallpaper-debian.jpg
feh --bg-scale ~/Pictures/wallpaper-debian.jpg 
feh --bg-scale /usr/share/wallpapers/wallpaper-debian.jpg 
feh --bg-scale /usr/share/wallpapers/debian.jpg 
cd
vim /etc/default/grub 
update-grub
cat /etc/default/grub 
cd /usr/share/wallpapers/
ls
mv /home/tomek/Pictures/wallpaper-debian.jpg .
mv wallpaper-debian.jpg debian.jpng
mv debian.jpng debian.jpg
vim /etc/lightdm/lightdm-gtk-greeter.conf 
cd ~/Downloads/
s
ls
ll
vim menu.xml 
ps aux | grep xfce
screen
vim ~/.config/tint2/tint2rc
apt-clean 
ls ~/.vim/swap/
vim ~/.config/tint2/tint2rc
vim ~/.config/openbox/rc.xml 
ll
sudo apt-get install systemd systemd-sysv
apt-clean 
sudo apt-clean 
sudo -s
Restart 
cd ~/.local/bin/
ls
cat dmenu_run 
/usr/bin/dmenu_run -b -p "Run:" -nb "#e5e5e5" -nf "#202020"
# /usr/bin/dmenu_run -b -p "Run:" -nb "#e5e5e5" -nf "#202020" -f ""
xfontsel 
/usr/bin/dmenu_run -b -p "Run:" -nb "#e5e5e5" -nf "#202020" -fn "-misc-fixed-bold-r-normal-*-14-*-*-*-c-*-iso10646-1"
/usr/bin/dmenu_run -b -p "Run:" -nb "#e5e5e5" -nf "#202020" -fn "-misc-fixed-bold-r-normal-*-13-*-*-*-c-*-iso10646-1"
/usr/bin/dmenu_run -b -p "Run:" -nb "#e5e5e5" -nf "#202020" -fn "-misc-fixed-*-r-normal-*-13-*-*-*-c-*-iso10646-1"
/usr/bin/dmenu_run -b -p "Run:" -nb "#e5e5e5" -nf "#202020" -fn "-misc-fixed-bold-r-normal-*-16-*-*-*-c-*-iso10646-1"
/usr/bin/dmenu_run -b -p "Run:" -nb "#e5e5e5" -nf "#202020" -fn "-misc-fixed-bold-r-normal-*-15-*-*-*-c-*-iso10646-1"
cd ~/Downloads/
ll
cd ~/.config/au
cd ~/.config/autostart/
ls
rm uxterm.desktop 
vim ~/.Xresources 
xrb ~/.Xresources 
xrdb ~/.Xresources 
vim ~/.Xresources 
ll
vim ~/.Xresources 
xrdb ~/.Xresources 
vim ~/.Xresources 
xrdb ~/.Xresources 
l
ll
mc
less ~/.xsession-errors
vim ~/.config/openbox/rc.xml 
cd /usr/share/themes/
find . -name *openbox*
vim ~/.config/tint2/tint2rc
ll
cd ~/.themes/
cd ~/Downloads/
cd ~/.themes/
ls
ll
rm -rf Faience*
ll
apt-cache search elementary
sudo -s
ll
cd ../
rm -rf .themes/
cd ~/Downloads/
ls
mc
cd ~/.local/share/themes/
ls
cd /usr/share/themes/
ls
ll
cd /usr/share/wallpapers/
ls
cd /usr/share/images/
ls
cd desktop-base/
l
ll
cd /usr/share/wallpapers/
ls
ll
apt-get --purge remove aptitude* nano mutt
apt-cache search libav
dpkg --get-selections | grep libav
apt-cache search libav | grep 53
apt-cache search libav | grep ^libav
apt-get install libavcodec-extra libavdevice54 libavfilter4 libavformat55 libavutil53
less ~/.xsession-errors
> ~/.xsession-errors
les ~/.xsession-errors
less ~/.xsession-errors
> ~/.xsession-errors
less ~/.xsession-errors
h
screen
apt-cache search ffmeg
apt-cache search ffmpeg
apt-cache search gstreamer
apt-cache search gstreamer | grep ^gstream
apt-cache search gstreamer | grep libav
dpkg --get-selections | grep gstream
vim ~/.config/openbox/rc.xml 
vim ~/.config/openbox/menu.xml 
vim ~/.bash_aliases 
vim ~/.config/openbox/menu.xml 
vim ~/.bash_exports 
vim ~/.bash_aliases 
cd ~/Downloads/
ks
ll
mc
screen
exit
find . -name *spotify
du -sh ~/.config/spotify/ ~/.cache/spotify/ ~/.local/share/spotify/
cd ~/.cache/spotify/
l
ll
du -sh .
du -sh *
rm mercury.db*
cd
ll
cd -
ls
ll
du -sh *
htop
dpkg --get-selections | grep scr
dpkg --get-selections | grep screen
sudo apt-get install xfce4-screenshooter
sudo apt-get --no-install-recommends install xfce4-screenshooter
apt-cache search screenshot
apt-cache search screenshot | grep xfce
cd ~/.local/share/
ls
cd themes/
ls
grep -RIin 464646 .
cd Shiki-Brave/
ls
ll
cd openbox-3/
ls
ll
v themerc 
grep -RIin '4f4f4f' .
cd ../../
grep -RIin '4f4f4f' .
perl -p -i -e 's/4f4f4f/2e3336/'
perl -p -i -e 's/4f4f4f/2e3336/' .
# perl -p -i -e 's/4f4f4f/2e3336/' 
grep -RIin '4f4f4f' | sed 's/\:.*$//'
grep -RIin '4f4f4f' | sed 's/\:.*$//' | uniq
perl -p -i -e 's/4f4f4f/2e3336/' $(grep -RIin '4f4f4f' | sed 's/\:.*$//' | uniq)
grep -RIin '4f4f4f'
grep -RIin '4f4f4f' .
screen -ls
pkill screen
screen -ls
screen -wipe
screen -ls
mc
cd ~/.config/
l
mv tint2rc tint2/tint2rc.sth
cd tint2/
ls
vim tint2rc tint2rc.sth 
ll
mv tint2rc.{bak,old}
ll
cp tint2rc{,.new}
cp tint2rc.sth tint2rc
ll
cp tint2rc.new tint2rc
vimdiff tint2rc tint2rc.sth 
ll
rm tint2rc.new tint2rc.sth 
ll
cd ~/Downloads/
ll
mc
vim ~/.config/openbox/rc.xml 
vim ~/.config/tint2/tint2rc
vim ~/.bashrc 
cd ~/Downloads/
ls
ll
mc
ln -s ~/.config/fontconfig/fonts.conf 
ll
rm fonts.conf 
cd ~
ln -s ~/.config/fontconfig/fonts.conf .fonts.conf
vim .fonts.conf 
vim ~/.config/fontconfig/fonts.conf 
grep -RIin medium ~
vim /home/tomek/.config/gtk-3.0/settings.ini
ls
ll
lxappearance 
grep -RIin medium ~/.config/
vim ~/.Xresources 
xrdb ~/.Xresources 
cd ~/Downloads/
ll
vim
cd /root/
ls
vim ~/.gtkrc-2.0 
vim .config/gtk-3.0/settings.ini 
mc
vim
vim ~/.Xresources 
sudo -s
dpkg --get-selections | grep libav
cd
vim ~/.Xresources 
xrdb ~/.Xresources 
xterm 
vim ~/.Xresources 
xrdb ~/.Xresources 
man xterm
cd ~/Downloads/
ll
apt-cache search steam
vim /etc/apt/sources.list
apt-get update 
apt-get dist-upgrade 
apt-cache search gtk3-engines
apt-cache search steam
dpkg --add-architecture i386
apt-get update 
apt-get install steam
apt-clean 
apt-get --purge autoremove 
apt-get install steam
apt-get install libgl1-nvidia-glx:i386
cd ~/Downloads/
ll
dpkg --get-selections > local.selections
vim local.selections 
cat local.selections | grep -v i386
cat local.selections | grep -v i386 > local.selections 
less local.selections 
dpkg --get-selections | grep -v i386 > local.selections
less local.selections 
vim local.selections 
vimdiff local.selections crunch.selections 
ll
mc
vim mint.selections 
vimdiff local.selections mint.selections 
screen
cd ~/.steam/
ls
ll
Stop 
apt-get install gxkb
sudo -
sudo -s
gxkb 
cd ~/.config/autostart/
ls
ll
cp /usr/share/applications/gxkb.desktop .
ll
vim gxkb.desktop 
cd
h
cd ~/Downloads/
ls
ll
vim ~/.config/tint2/tint2rc
l
ll
mc
mount
mount | grep tmpfs
mount | grep '\/tmp'
sudo vim /etc/fstab
vim ~/.config/gxkb.cfg 
man gxkb
dpkg -L gxkb 
mount
mount | grep tmpfs
h
mount | 
mount | grep tmpfs
cd /media/n
cd /mnt/ntfs/
ls
ll
cd c
ll
cd ../
cd d
ls
cd
apt-get install update-notifier
dpkg -L gnome-packagekit
dpkg --get-selections | grep apt
apt-cache show gnome-packagekit-tools
apt-cache show gnome-packagekit
cd /etc/xdg/
ll
cd autostart/
ll
find /usr/share/applications/ -name gpk*
apt-cache search update-notifier
apt-get install update-notifier
apt-cache show gnome-packagekit
dpkg --get-selections | grep naut
systemctl status packagekit.service 
ps aux | grep package
apt-cache search notifier
dpkg -L update-notifier-common
dpkg -qL update-notifier-common
dpkg -L gnome-packagekit
dpkg -L packagekit
dpkg -L packagekit-tools
apt-get install update-notifier-common 
dpkg -L update-notifier-common 
/etc/apt/apt.conf.d/99update-notifier
less /etc/apt/apt.conf.d/99update-notifier
apt-cache search updates-available
dpkg -L update-notifier-common 
less /etc/update-notifier/
less /etc/apt/apt.conf.d/99update-notifier
tail /var/log/apt/history.log 
cat /var/log/apt/history.log
apt-get --purge remove gxkb gnome-packagekit-data libibus-1.0-5 gnome-packagekit libgnome-desktop-3-7 gnome-packagekit-session libelfg0 packagekit hwdata packagekit-tools update-notifier python3-packagekit gnome-settings-daemon gnome-desktop3-data packagekit-backend-aptcc libwacom-common libglib2.0-bin libwacom2 python3-dbus update-notifier-common
systemctl status plymouth-start
apt-clean 
cd ~/Downloads/
ls
vimdiff local.selections mint.selections 
cat mint.selections | grep package
apt-cache search mouon
apt-cache search packagekit
ps aux | grep package
cd ~/Music
cd ../
ll
cd /mnt/ntfs/d/Program\ Files\ \(x86\)/Steam/
ls
ll
ls -l | grep SteamApps
ll
ls
find . -name SteamApps
cd ..
l
cd Steam/
l
less ~/.xsession-errors
cd ~/Documents/
ls
ll
cd ~/Downloads/
ls
less crunch.selections 
dpkg -L gnome-packagekit
dpkg --get-selections | grep package
dpkg -L gnome-packagekit-session
gpk-prefs 
ps aux | grep gpk
vim ~/.config/tint2/tint2rc
gpk-dbus-service 
cd ~/Downloads/
ll
less mint.
less mint.selections 
less /usr/lib/update-notifier/update-motd-updates-available

less /usr/lib/update-notifier/update-motd-updates-available
find ~ -name *packagek*
cd ~
ll
mc
vim ~/.config/gxkb.cfg 
apt-cache search xxkb
apt-cache show xxkb 
ll
cd ~/.config/au
cd ~/.config/autostart/
ll
rm gxkb.desktop 
cd
mount | grep ntfs
cd ~/Downloads/
ls
ll
# vimdiff local.selections crunch.selections 
cd ~/.steam/
ls
ll
cd steam/
ll
mount
mount | grep ntf
less /etc/fstab
cd
screen
vim ~/.config/tint2/tint2rc
apt-cache search update-notifier
apt-cache search packagekit
apt-get install apper
apt-cache search  listaller
apt-cache search gnome-settings-daemon-updates
apt-cache search gnome-settings-daemon
dpkg --get-selections | grep packagekit
apt-cache search gnome-packagekit-session
apt-cache show gnome-packagekit-session
apt-cache show gnome-settings-daemon
h
screen
ll
du -sh *
ssh -A tm5073@tm5073
cd ~/.vim
ll
cd bundle/
ll
cd vim-autocomplpop/
ll
cd ../
ll
cd vim-autocomplpop/
ll
git purr
cd ..
ll
git clone https://github.com/junegunn/vim-easy-align
mv vim-autocomplpop{,-old}
git clone https://github.com/othree/vim-autocomplpop
;;
ll
rm -rf vim-autocomplpop-old
vim ~/.vimrc 
cd ../
ll
./update_bundle 
cd ..
pip --help
vim ~/.bash_exports 
pip install --help
pip install --user BeautifulSoup
pip install --user Django
pip install --user simplejson
pip install --user --upgrade simplejson
pip install --help
pip install --user --force-reinstall simplejson
pip install --user --upgrade --force-reinstall simplejson
pip install --user mock
pip install --user html
pip install --user PyYAML
pip help
pip uninstall PyYAML
pip
pip show PIL
pip show search PIL
pip search PIL
pip search PIL | gtep ^PIL
pip search PIL | grep ^PIL
pip install --user xls_xlrd
pip search xls_xlwt
pip search xls
pip search xlwt
pip search xlrd
pip install --user xlrd xlwt
mc
cd
ls ~/.config/{autostart,fontconfig,galculator,gsimplecal,gtk-2.0,gtk-3.0,openbox,tint2,Trolltech.conf} ~/.dosbox/ ~/.local/bin/dmenu_run ~/.local/share/applications/ ~/.local/share/themes/ ~/.purple/ ~/.scummvm/ ~/.ssh/ ~/.vim/ ~/Downloads/pip.freeze ~/tm5073-vpn/ ~/.Xresources ~/bash* ~/.bcrc ~/.gitconfig ~/.gtkrc-2.0 ~/.guile ~/.gvimrc ~/.npmrc ~/.profile ~/.pydistutils.cfg ~/.pystartup ~/.screenrc ~/.scummvmrc ~/.selected_editor ~/.vimrc ~/.xscreensaver ~/.xsessionrc 
ls ~/.config/{autostart,fontconfig,galculator,gsimplecal,gtk-2.0,gtk-3.0,openbox,tint2,Trolltech.conf} ~/.dosbox/ ~/.local/bin/dmenu_run ~/.local/share/applications/ ~/.local/share/themes/ ~/.purple/ ~/.scummvm/ ~/.ssh/ ~/.vim/ ~/Downloads/pip.freeze ~/tm5073-vpn/ ~/.Xresources ~/.bash* ~/.bcrc ~/.gitconfig ~/.gtkrc-2.0 ~/.guile ~/.gvimrc ~/.npmrc ~/.profile ~/.pydistutils.cfg ~/.pystartup ~/.screenrc ~/.scummvmrc ~/.selected_editor ~/.vimrc ~/.xscreensaver ~/.xsessionrc 
tar -czvf dotfiles.tar.gz ~/.config/{autostart,fontconfig,galculator,gsimplecal,gtk-2.0,gtk-3.0,openbox,tint2,Trolltech.conf} ~/.dosbox/ ~/.local/bin/dmenu_run ~/.local/share/applications/ ~/.local/share/themes/ ~/.purple/ ~/.scummvm/ ~/.ssh/ ~/.vim/ ~/Downloads/pip.freeze ~/tm5073-vpn/ ~/.Xresources ~/.bash* ~/.bcrc ~/.gitconfig ~/.gtkrc-2.0 ~/.guile ~/.gvimrc ~/.npmrc ~/.profile ~/.pydistutils.cfg ~/.pystartup ~/.screenrc ~/.scummvmrc ~/.selected_editor ~/.vimrc ~/.xscreensaver ~/.xsessionrc 
ll
du -sh dotfiles.tar.gz 
cd ~/
OA
d
cd
apt-cache search virtualbox
apt-get install virtualbox
dpkg --get-selections | grep python
apt-cache search python | grep ^python
apt-cache search python | grep ^python | less
apt-get install python-dev
apt-get install PyYAML
apt-up 
cd ~/Downloads/
s
ls
mc
cd ~/Downloads/
ll
cat pip.freeze 
cd ~/workspace/Python/ML/
ls
ll
cd ~/Downloads/
ls
ll
rm mint.selections 
mc
m
,c
mc
rm ~/dotfiles.tar.gz 
laudanum44
apt-cache search teamviewer
screen
ps aux | grep team
cd ~/workspace/Python/ML/
ll
less imogeen_chce-przeczytac.json 
screen -ls
h
screen
sudo -s
cd ~/.config/au
cd ~/.config/autostart/
ls
cp /usr/share/applications/teamviewer-teamviewer9.desktop .
vim teamviewer-teamviewer9.desktop 
h
vim ~/.Xresources 
xrdb ~/.Xresources 
ssh -A tm5073@tm5073
vim ~/.config/tint2/tint2rc
ssh -A tm5073@tm5073
python -tt
# cp /usr/share/applications/teamviewer-teamviewer9.desktop .
vim ~/.config/tint2/tint2rc
cd ~/workspace/Python/
ls
ll
cd ML
ll
ack 'auth' .
ll
git st
find . -name *.cache
git pull --rebase
git log
git st
pip install --user request
pip install --user requests
nslookup http://www.opac.ksiaznica.bielsko.pl/
nslookup www.opac.ksiaznica.bielsko.pl
nslookup 212.244.68.155
nslookup ip-212-244-68-155.sanetja.pl
less imogeen_chce-przeczytac.json 
ll
python -tt opac.py 
python -tt opac.py 2>&1 | lessq
python -tt opac.py 
python -tt opac.py 2>&1 | less
python -tt opac.py 2>&1 > sese.html
less sese.html 
firefox sese.html 
rm sese.html 
python -tt opac.py 2>&1 > ml.html
firefox ml.html 
python -tt opac.py 2>&1 > ml.html
firefox ml.html 
python -tt opac.py 2>&1 > ml.html; firefox ml.html 
python -tt opac.p

python -tt opac.py 2>&1 > ml.html; firefox ml.html 
python -tt opac.py 
python -tt opac.py 
python -tt opac.py 2>&1 > ml.html; firefox ml.html 
python -tt
python -tt opac.py 2>&1 > ml.html; firefox ml.html 
python -tt opac.py 2>&1
python -tt opac.py 2>&1 > ml.html; firefox ml.html 
python -tt opac.py 2>&1
python -tt opac.py 2>&1 > ml.html; firefox ml.html 
python -tt opac.py 2>&1
python -tt opac.py 2>&1 > ml.html; firefox ml.html 
python -tt opac.py 2>&1
python -tt
pip install --user httplib2
python -tt opac.py 2>&1
python -tt opac.py 2>&1 > ml.html; firefox ml.html 
tar -czvf dotfiles.tar.gz ~/.config/{autostart,fontconfig,galculator,gsimplecal,gtk-2.0,gtk-3.0,openbox,tint2,Trolltech.conf} ~/.dosbox/ ~/.local/bin/dmenu_run ~/.local/share/applications/ ~/.local/share/themes/ ~/.purple/ ~/.scummvm/ ~/.ssh/ ~/.vim/ ~/Downloads/pip.freeze ~/tm5073-vpn/ ~/.Xresources ~/.bash* ~/.bcrc ~/.gitconfig ~/.gtkrc-2.0 ~/.guile ~/.gvimrc ~/.npmrc ~/.profile ~/.pydistutils.cfg ~/.pystartup ~/.screenrc ~/.scummvmrc ~/.selected_editor ~/.vimrc ~/.xscreensaver ~/.xsessionrc
dpkg --get-selections > ~/Downloads/local.selections 
tar -czvf dotfiles.tar.gz ~/.config/{autostart,fontconfig,galculator,gsimplecal,gtk-2.0,gtk-3.0,openbox,tint2,Trolltech.conf} ~/.dosbox/ ~/.local/bin/dmenu_run ~/.local/share/applications/ ~/.local/share/themes/ ~/.purple/ ~/.scummvm/ ~/.ssh/ ~/.vim/ ~/Downloads/pip.freeze ~/tm5073-vpn/ ~/.Xresources ~/.bash* ~/.bcrc ~/.gitconfig ~/.gtkrc-2.0 ~/.guile ~/.gvimrc ~/.npmrc ~/.profile ~/.pydistutils.cfg ~/.pystartup ~/.screenrc ~/.scummvmrc ~/.selected_editor ~/.vimrc ~/.xscreensaver ~/.xsessionrc ~/Downloads/local.selections 
ll
ls 
feh --bg-scale ~/Pictures/MV.png 
feh --bg-scale ~/Pictures/MV2.png 
cd ~/workspace/Python/ML/
ll
less imogeen_chce-przeczytac.json 
apt-up 
grep -RIin cookiejar_from_dict /usr/lib/
cd ~/workspace/Python/
grep -RIin join .
python -tt
vim ~/.config/tint2/tint2rc
screen
