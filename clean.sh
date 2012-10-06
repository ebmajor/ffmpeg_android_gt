#!/bin/bash

NDK_DIR=/media/host/android-ndk-r8b-linux

if [ ! -d "$NDK_DIR" ]; then
	echo "Please set correctly your Android Native Development Kit path"
	echo "Current path: $NDK_DIR"
	return
fi

if [ `cat $NDK_DIR/RELEASE.TXT | grep 'r8b' | wc -l` -eq 0 ]; then
	echo "This script is prepared to compile FFmpeg using the NDK version r6b"
	echo "Please download the right version of NDK"
	return
fi

clean() {
	rm -f jni/*.tmp
	rm -f jni/*_files.mk
}

$NDK_DIR/ndk-build clean

clean
