ffmpeg -f oss -i /dev/dsp2 -f video4linux2 -i /dev/video1 -fs 3145728 -s 1920x1080 -r 30 out.mp4
