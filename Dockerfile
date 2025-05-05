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

# Set entrypoint
CMD ["/bin/bash"]