# Unreal Engine 4 Build container
#
# VERSION               4.8.0

FROM      centos:centos7
MAINTAINER Wesley Hearn <wesley@shearn.me>

# Make sure we are fully updated
RUN yum update -y

# Needed Deps
RUN yum install -y autoconf git curl bison flex dos2unix cmake unzip gcc wget \
    redhat-lsb-core gtk3-devel gtk2-devel qt-devel libstdc++-devel gcc-c++ ; \
    yum clean all

RUN cd /etc/yum.repos.d && wget https://copr.fedoraproject.org/coprs/jknife/ue4deps/repo/epel-7/jknife-ue4deps-epel-7.repo

RUN yum install -y mono-core mono-devel clang ; yum clean all ; cp /usr/lib64/libMonoPosixHelper.so /usr/lib

ADD build.sh /root/build.sh

ENV BUILD Editor

ENV HOME /root

CMD ["bash", "/root/build.sh"]
