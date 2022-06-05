

WORKDIR := ${PWD}
CT_NG := ${WORKDIR}/crosstool-ng


download:
	if [ ! -d ${CT_NG} ]; \
	then \
		git clone https://github.com/crosstool-ng/crosstool-ng; \
	fi


install: download
	
	if [ ! -f '${CT_NG}/ct-ng' ]; \
	then \
		cd ${CT_NG} && ./bootstrap; \
		cd ${CT_NG} && ./configure DESTDIR=${WORKDIR}/crosstool-ng ; \
		cd ${CT_NG} && make &&  make install DESTDIR=${WORKDIR}/crosstool-ng; \
	fi

	

crosstool: install
	export CT_TOOLCHAIN=${WORKDIR}/x-tools;	\
	cp ${WORKDIR}/config_crosstool ${CT_NG}/.config; \
	cd ${CT_NG} && ./ct-ng build



clean:
	${CT_NG}/ct-ng clean


distclean:
	${CT_NG}/ct-ng distclean


all: download install crosstool
