FROM julia:latest

# sudo apt-get install -y x11-xserver-utils
# docker build --tag julia-displaz:latest .
# xhost +local:root
# docker run --rm -it  --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" julia-displaz

RUN apt update

RUN apt-get install -y gnuplot-x11
RUN a="0.0 0.0 0.0";echo $a>>temp.txt
RUN a="1.0 1.0 0.0";echo $a>>temp.txt

CMD gnuplot -p -e "set terminal x11; set zrange [0:10.0];set yrange [0:10.0];unset xtics;unset ytics;unset ztics;unset border;set xrange [0:10.0];set label 1 \"one\" at  1.0,1.0,1.0; set arrow 3 from 2.0,2.0,9.0 to 9.10,9.10,9.10 nohead lc rgb \"blue\";splot NaN t '';pause -1"
