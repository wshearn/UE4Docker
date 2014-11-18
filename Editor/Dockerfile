# Unreal Engine 4 Build container
#
# VERSION               4.5.0

FROM      centos:centos7
MAINTAINER Wesley Hearn <wesley@shearn.me>

# Make sure we are fully updated
RUN yum update -y

# Needed Deps
RUN yum install -y autoconf git curl bison flex dos2unix cmake unzip redhat-lsb-core wget ; yum clean all

RUN wget https://copr.fedoraproject.org/coprs/jknife/ue4deps/repo/epel-7/jknife-ue4deps-epel-7.repo -o /etc/yum.repos.d/jknife-ue4deps-epel-7.repo && \
  yum install -y mono-core mono-devel clang ; yum clean all

ADD build.sh /root/build.sh

ENV BUILD Editor

ENV HOME /root

CMD    ["bash", "/root/build.sh"]
