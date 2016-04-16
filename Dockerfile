FROM debian:wheezy
MAINTAINER Adebola Samuel Olowofela "samcrosoft@gmail.com"

ADD install.sh install.sh
RUN chmod +x install.sh && ./scripts/install.sh && rm scripts/install.sh

EXPOSE 11300
CMD ["beanstalkd", "-p", "11300"]
