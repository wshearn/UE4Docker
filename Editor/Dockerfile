# Unreal Engine 4 Build container
#
# VERSION               4.5.0

FROM      centos:centos7
MAINTAINER Wesley Hearn <wesley@shearn.me>

# Make sure we are fully updated
RUN yum update -y

# Install EPEL (for MONO)
RUN yum install -y wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

# Needed Deps
RUN yum install -y mono-core mono-devel autoconf git curl bison flex dos2unix cmake unzip redhat-lsb-core

RUN wget -c http://llvm.org/releases/3.5.0/clang+llvm-3.5.0-x86_64-fedora20.tar.xz && \
  tar -mpxvf --strip-components 1 clang+llvm-3.5.0-x86_64-fedora20.tar.xz -C /usr/local/ clang+llvm-3.5.0-x86_64-fedora20/ && \
  restorecon -Rvv /usr/local && \
  rm -f clang+llvm-3.5.0-x86_64-fedora20.tar.xz

ADD ../build.sh /root/build.sh

ENV BUILD Editor

ENV HOME /root

CMD    ["bash", "/root/build.sh"]
