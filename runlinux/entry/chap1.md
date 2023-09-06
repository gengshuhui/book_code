sudo apt-get install build-essential gcc-aarch64-linux-gnu bison flex libssl-dev qemu-system-arm libncurses5-dev build-essential


//gpg error
apt-key adv --keyserver pgp.mit.edu --recv-keys 648ACFD622F3D138

//in debian arm vm
#sudo apt-get --allow-unauthenticated update
#sudo apt-get --allow-insecure-repositories update

#vim /etc/apt/apt.conf.d/99my
#APT::Get::AllowUnauthenticated "true";

