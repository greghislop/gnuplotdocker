FROM julia:latest

# Docker GPU support using Nvidia Container Toolkit
# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html
#
# $ docker run --rm -it --gpus all -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 <image> bash

RUN apt update

RUN apt-get install -y gnuplot-x11
RUN a="0.0 0.0 0.0";echo $a>>temp.txt
RUN a="1.0 0.0 0.0";echo $a>>temp.txt
CMD gnuplot -p -e "splot \"temp.txt\" using 1:2:3 with lines, \"temp.txt\" using 1:2:3 with lines; pause -1"
