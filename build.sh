#!/bin/sh

export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/home/shaqibxyz/proton-clang/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/shaquibxyz/proton-clang/aarch64-linux-gnu/bin
export CROSS_COMPILE_ARM32=/home/shaquibxyz/proton-clang/arm-linux-gnueabi/bin


make_kernel_init(){
		rm -rf out
		echo clean
		make clean && make mrproper
		mkdir -p out
		echo set defconfig
		#make CC=clang O=out vendor/violet-perf_defconfig
		make CC=clang O=out vendor/violet-perf_defconfig
}

make_and_config(){
		make_kernel_init
		echo build kernel
		make CC=clang O=out -j8
}

make_simply(){
		make_kernel_init
		echo build kernel
		make CC=clang O=out -j8
}

make_headers(){
		cd out make modules_install
		#make headers_install
}

#make_and_config
make_simply
#make_headers
