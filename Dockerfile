FROM ubuntu:20.04

ENV TZ=Asia/Singapore
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y \
        ccache \
        git \
        mercurial \
        gcc \
        g++ \
        vim \
        python3 \
        python3-dev \
        python3-setuptools \
        python3-pip \
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
        wget \
        pkg-config \
        tcpdump \
        libgtk-3-dev

RUN mkdir -p /usr/ns3
WORKDIR /usr 

# avoid https://groups.google.com/g/ns-3-users/c/079OdTrF0es
# by using cppyy==2.4.1
RUN python3 -m pip install --user cppyy==2.4.1

RUN wget https://www.nsnam.org/release/ns-allinone-3.37.tar.bz2  && \
    tar -jxvf ns-allinone-3.37.tar.bz2

ENV NS3_BINDINGS_INSTALL_DIR=/root/.local/lib/python3.8/site-packages

RUN cd ns-allinone-3.37 && ./build.py --enable-examples --enable-tests

RUN ln -s /usr/ns-allinone-3.37/ns-3.37/ /usr/ns3/

RUN apt-get clean && \
    rm -rf /var/lib/apt && \
    rm ns-allinone-3.37.tar.bz2
