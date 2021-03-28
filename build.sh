#!/bin/sh

export ARCH=arm64
export SUBARCH=arm64
export CLANG_PATH=/home/shaquibimdad/Desktop/kernel-dev/Toolchain-complete/linux-x86-refs_heads_master/clang-r383902/bin
export PATH=${CLANG_PATH}:${PATH}
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=/home/shaquibimdad/Desktop/kernel-dev/Toolchain-complete/android-ndk-r23-beta2/toolchains/llvm/prebuilt/linux-x86_64/bin/aarch64-linux-android-


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
