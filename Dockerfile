FROM ubuntu:25.04
WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# install lttools and HFST
RUN curl -sS https://apertium.projectjj.com/apt/install-release.sh | bash && \
    apt-get -f -y install apertium-all-dev hfst

# install lexd
RUN cd ../ && \
    git clone https://github.com/apertium/lexd.git && \
    cd lexd && \
    ./autogen.sh && \
    make && \
    make install && \
    cd ../

# set utf8 locale
RUN apt-get -y install locales && \
    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

# Set entrypoint
CMD ["/bin/bash"]