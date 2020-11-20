# Archlinux for Win with sh, gcc, perl and password in pwd.txt
FROM archlinux:latest

# UA mirrorlist
#RUN echo 'Server = https://mirrors.nix.org.ua/linux/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
RUN echo 'Server = https://mirror.mirohost.net/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist

# Upgrade
RUN pacman -Syy

# systemd + openssh
RUN pacman -S --needed --noconfirm base linux linux-firmware
RUN pacman -S --needed --noconfirm openssh
RUN systemctl enable sshd

# Devel packages
RUN pacman -S --needed --noconfirm base-devel fpc gcc cmake gdb nasm
RUN pacman -S --needed --noconfirm vim mc git curl

# Perl
RUN pacman -S --needed --noconfirm perl-cpan-meta perl-lwp-protocol-https

# Init
RUN useradd -m -g users -G wheel -s /bin/bash nightingale
COPY pwd.txt /pwd.txt
RUN echo "nightingale:$(grep -Eo '^[^ ]+' /pwd.txt)" | sudo chpasswd
RUN rm /pwd.txt
RUN sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/' /etc/sudoers
RUN ln -s /usr/share/zoneinfo/Europe/Kiev /etc/localtime
RUN echo 'vim -R $@' > /bin/view; chmod a+x /bin/view
ENTRYPOINT /sbin/init
STOPSIGNAL SIGRTMIN+3
