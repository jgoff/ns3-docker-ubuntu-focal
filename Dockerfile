FROM ubuntu:20.04

ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y \
        git \
        mercurial \
        gcc \
        g++ \
        vim \
        python3 \
        python3-dev \
        python3-setuptools \
        qt5-default \
        gir1.2-goocanvas-2.0 \
        python3-gi \
        python3-gi-cairo \
        python3-pygraphviz \
        gir1.2-gtk-3.0 \
        ipython3 \
        autoconf \
        cvs \
        bzr \
        unrar \
        gdb \
        valgrind \
        uncrustify \
        flex \
        bison \
        libfl-dev \
        tcpdump \
        gsl-bin \
        libgslcblas0 \
        libgsl-dev \
        sqlite \
        sqlite3 \
        libsqlite3-dev \
        libxml2 \
        libxml2-dev \
        cmake \
        libc6-dev \
        libc6-dev-i386 \
        libclang-dev \
        llvm-dev \
        automake \
        libgtk2.0-0 \
        libgtk2.0-dev \
        vtun \
        lxc \
        libboost-all-dev \
        wget

RUN mkdir -p /usr/ns3
WORKDIR /usr 

RUN wget https://www.nsnam.org/release/ns-allinone-3.37.tar.bz2  && \
    tar -jxvf ns-allinone-3.37.tar.bz2

RUN cd ns-allinone-3.37 && ./build.py --enable-examples --enable-tests

RUN ln -s /usr/ns-allinone-3.37/ns-3.37/ /usr/ns3/

RUN apt-get clean && \
    rm -rf /var/lib/apt && \
    rm ns-allinone-3.37.tar.bz2
