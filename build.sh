#!/bin/sh

source poky/oe-init-build-env

bitbake-layers add-layer ../metas/meta-openembedded/meta-oe
bitbake-layers add-layer ../metas/meta-openembedded/meta-python/
bitbake-layers add-layer ../metas/meta-openembedded/meta-networking/
bitbake-layers add-layer ../metas/meta-openembedded/meta-multimedia/
bitbake-layers add-layer ../metas/meta-sunxi/
bitbake-layers add-layer ../metas/meta-camera/
bitbake-layers add-layer ../metas/meta-script/

echo 'IMAGE_INSTALL_append = " vlc python3 python3-cmd2 curl go camera script"' >> conf/local.conf

echo 'LICENSE_FLAGS_WHITELIST="commercial"' >> conf/local.conf

echo 'DISTRO_FEATURES_append = " systemd"' >> conf/local.conf
echo 'VIRTUAL-RUNTIME_init_manager = "systemd"' >> conf/local.conf
echo 'DISTRO_FEATURES_BACKFILL_CONSIDERED = "sysvinit"' >> conf/local.conf
echo 'VIRTUAL-RUNTIME_initscripts = ""' >> conf/local.conf

MACHINE=qemux86-64 bitbake core-image-minimal
#MACHINE=orange-pi-one bitbake core-image-minimal
