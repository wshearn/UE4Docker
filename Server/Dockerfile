# Unreal Engine 4 Build container
#
# VERSION               0.0.1

FROM      centos:centos6
MAINTAINER Wesley Hearn <wesley@shearn.me>

# Make sure we are fully updated
RUN yum update -y

# Install EPEL (for MONO)
RUN yum install -y http://mirror.pnl.gov/epel/6/i386/epel-release-6-8.noarch.rpm

# Mono
RUN yum install -y mono-core mono-devel

# clang and deps
RUN yum install -y autoconf git curl bison flex dos2unix clang cmake

# Required to extract steamworks SDK
RUN unzip install -y unzip

ADD ../build.sh /root/build.sh

ENV BUILD Server

ENV HOME /root

CMD    ["bash", "/root/build.sh"]
