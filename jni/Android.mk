#this directory variable declaration
LOCAL_PATH := $(call my-dir)/ffmpeg

#avutil module
include $(CLEAR_VARS)
LOCAL_MODULE := avutil
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -DHAVE_AV_CONFIG_H
include $(LOCAL_PATH)/../lib$(LOCAL_MODULE)_files.mk
include $(BUILD_STATIC_LIBRARY)
#end of avutil module

#swscale module
include $(CLEAR_VARS)
LOCAL_MODULE    := swscale
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -DHAVE_AV_CONFIG_H
LOCAL_STATIC_LIBRARIES := avutil
LOCAL_LDFLAGS := 
include $(LOCAL_PATH)/../lib$(LOCAL_MODULE)_files.mk
include $(BUILD_STATIC_LIBRARY) 
#end of swscale module

#avformat module
include $(CLEAR_VARS)
LOCAL_MODULE := avformat
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -DHAVE_AV_CONFIG_H
include $(LOCAL_PATH)/../lib$(LOCAL_MODULE)_files.mk
LOCAL_STATIC_LIBRARIES := avutil avcodec
LOCAL_LDFLAGS := -L$(SYSROOT)/usr/lib -lz
include $(BUILD_STATIC_LIBRARY)
#end of avformat module

#avcodec module
include $(CLEAR_VARS)
LOCAL_MODULE := avcodec
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -DHAVE_AV_CONFIG_H
include $(LOCAL_PATH)/../lib$(LOCAL_MODULE)_files.mk
LOCAL_STATIC_LIBRARIES := avutil
LOCAL_LDFLAGS := -L$(SYSROOT)/usr/lib -lz -lm
include $(BUILD_STATIC_LIBRARY)
#end of avcodec module

#avdevice module
include $(CLEAR_VARS)
LOCAL_MODULE := avdevice
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -DHAVE_AV_CONFIG_H
include $(LOCAL_PATH)/../lib$(LOCAL_MODULE)_files.mk
LOCAL_STATIC_LIBRARIES := avutil avcodec avformat
LOCAL_LDFLAGS := -L$(SYSROOT)/usr/lib -lz -lm
include $(BUILD_STATIC_LIBRARY)
#end of avdevice module

#postproc module
include $(CLEAR_VARS)
LOCAL_MODULE := postproc
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -DHAVE_AV_CONFIG_H
include $(LOCAL_PATH)/../lib$(LOCAL_MODULE)_files.mk
LOCAL_STATIC_LIBRARIES := avutil
LOCAL_LDFLAGS := -L$(SYSROOT)/usr/lib -lz -lm
include $(BUILD_STATIC_LIBRARY)
#end of postproc module

#avfilter module
include $(CLEAR_VARS)
LOCAL_MODULE := avfilter
LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -DHAVE_AV_CONFIG_H
include $(LOCAL_PATH)/../lib$(LOCAL_MODULE)_files.mk
LOCAL_STATIC_LIBRARIES := avutil avcodec avformat swscale
LOCAL_LDFLAGS := -L$(SYSROOT)/usr/lib -lz -lm
include $(BUILD_STATIC_LIBRARY)
#end of avfilter module

#ffmpeg module
include $(CLEAR_VARS)
LOCAL_MODULE := ffmpeg
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := \
cmdutils.c \
ffmpeg.c \

LOCAL_STATIC_LIBRARIES := avdevice avfilter avformat avcodec swscale avutil postproc
LOCAL_LDFLAGS := -lz
#LOCAL_LDFLAGS := -L$(SYSROOT)/usr/lib -lz -lm
#LOCAL_C_INCLUDES := \
#$(FFMPEG_ROOT_DIR)/$(FFMPEG_CONFIG_DIR)
#LOCAL_STATIC_LIBRARIES := avdevice avfilter avformat avcodec swresample swscale avutil avicap32 m bz2 z psapi
#LOCAL_SHARED_LIBRARIES := \
#libz
include $(BUILD_EXECUTABLE)

