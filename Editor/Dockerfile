# Imreal Engine 4 Build container
#
# VERSION               0.0.1

FROM      ubuntu:14.04
MAINTAINER Wesley Hearn <wesley@shearn.me>

RUN apt-get update
RUN apt-get -y dist-upgrade

# Mono
RUN apt-get install -y mono-complete mono-dmcs

# clang and deps
RUN apt-get install -y autoconf git curl bison flex zlib1g-dev libglew1.6-dev dos2unix clang-3.3 cmake

# For Linux Native Dialogs
RUN apt-get install -y libgtk-3-dev

ADD build.sh /root/build.sh

ENV HOME /root

CMD    ["bash", "/root/build.sh"]