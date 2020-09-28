FROM julia:latest

# sudo apt-get install -y x11-xserver-utils
# docker build --tag julia-displaz:latest .
# xhost +local:root
# docker run --rm -it  --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" julia-displaz

RUN apt update

RUN apt-get install -y gnuplot-x11
RUN a="0.0 0.0 0.0";echo $a>>temp.txt
RUN a="1.0 0.0 0.0";echo $a>>temp.txt
CMD gnuplot -p -e "splot \"temp.txt\" using 1:2:3 with lines, \"temp.txt\" using 1:2:3 with lines; pause -1"
