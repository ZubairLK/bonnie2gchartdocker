FROM tutum/apache-php
MAINTAINER Zubair Lutfullah Kakakhel <zubair.lutfullah@gmail.com>

WORKDIR /app
RUN mkdir bonnie
RUN curl -L https://github.com/pommi/bonnie2gchart/tarball/master | tar zx -C bonnie
RUN mv bonnie/*/* bonnie/
RUN mkdir bonnieoutside
RUN rm bonnie/bonnie.csv
ADD sample/bonnie.csv /app/bonnieoutside/bonnie.csv
RUN ln -s /app/bonnieoutside/bonnie.csv /app/bonnie/bonnie.csv

CMD ["/run.sh"]
