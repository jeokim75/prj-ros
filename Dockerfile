FROM ubuntu:18.04
MAINTAINER jeongsoon kim

RUN apt-get update

# Connect PHP & MYSQL
RUN apt-get install -y omping
