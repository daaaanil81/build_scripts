#!/bin/sh

source poky/oe-init-build-env

bitbake-layers add-layer ../metas/meta-openembedded/meta-oe
bitbake-layers add-layer ../metas/meta-openembedded/meta-python/
bitbake-layers add-layer ../metas/meta-openembedded/meta-perl/
bitbake-layers add-layer ../metas/meta-openembedded/meta-networking/
bitbake-layers add-layer ../metas/meta-openembedded/meta-webserver/
bitbake-layers add-layer ../metas/meta-openembedded/meta-filesystems/
bitbake-layers add-layer ../metas/meta-openembedded/meta-multimedia/
bitbake-layers add-layer ../metas/meta-sunxi/
bitbake-layers add-layer ../metas/meta-go-binary
bitbake-layers add-layer ../metas/meta-camera/

#echo 'SSTATE_MIRRORS = "\
#     file://.* http://sstate.yoctoproject.org/dev/PATH;downloadfilename=PATH \n \
#     file://.* http://sstate.yoctoproject.org/3.0.2/PATH;downloadfilename=PATH \n \
#     file://.* http://sstate.yoctoproject.org/3.1/PATH;downloadfilename=PATH \n \
#     "' >> conf/local.conf

echo 'IMAGE_INSTALL_append = " vlc python3 python3-cmd2 go camera"' >> conf/local.conf

echo 'LICENSE_FLAGS_WHITELIST="commercial"' >> conf/local.conf

MACHINE=qemux86-64 bitbake core-image-minimal
#MACHINE=orange-pi-one bitbake core-image-minimal
