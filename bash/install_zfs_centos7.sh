yum install -y epel-release
yum localinstall -y --nogpgcheck http://download.zfsonlinux.org/epel/zfs-release.el7.noarch.rpm
gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
yum install -y kernel-devel zfs
modprobe zfs

