Docker is quite a nifty little tool.

I thought I'd learn a bit. And made a dockerized version of bonnie2gchart [1] [2]

I am sure there are multiple better ways to do this than this attempt.

But its ok :)

This docker depends on https://registry.hub.docker.com/u/tutum/apache-php/

And you'll need to build this docker instead of just pull it.

 $ git clone https://github.com/ZubairLK/bonnie2gchartdocker.git
 $ docker build -t zubairlk/bonnie bonnie2gchartdocker

This should now build the docker image. It will pull tutum/apache-php if it doesn't exist already.

The rest of the image is quite simple. The Dockerfile is self-explanatory.
Just uses curl to grab the tarball from [2].

Extracts it in /app folder which tutum/apache-php links to /var/www/html

And then sets up a symlink. So that a bonnie.csv file outside can be used to generate the charts.

Then run the created docker image using

 $ docker run -d -p 8080:80 -v /home/yourhome/bonnie2gchartdocker/sample:/app/bonnie/bonnieoutside zubairlk/bonnie 

-d means run as daemon in background
-p maps port 8080 on localhost to 80 inside docker
-v maps localpath:tocontinerpath must be absolute

zubairlk/bonnie is the image name. You can change it.

[1] http://pommi.nethuis.nl/bonnie-to-google-chart/
[2] https://github.com/pommi/bonnie2gchart/
