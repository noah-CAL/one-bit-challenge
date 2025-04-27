# from git@github.com:noah-CAL/riscv-docker-dev.git
FROM ubuntu:latest

RUN apt update -y && apt install git -y

RUN git clone https://github.com/riscv/riscv-gnu-toolchain riscv-gnu-toolchain

# https://github.com/riscv-collab/riscv-gnu-toolchain
# Prequisite packages needed
RUN apt update -y && apt install -y \
	autoconf \
	automake \ 
	autotools-dev \
	curl \
	python3 \
	python3-pip \
	python3-tomli \
	libmpc-dev \
	libmpfr-dev \
	libgmp-dev \
	gawk \
	build-essential \
	bison \
	flex \
	texinfo \
	gperf \
	libtool \
	patchutils \
	bc \
	zlib1g-dev \
	libexpat-dev \
	ninja-build \
	git \
	cmake \
	libglib2.0-dev \
	libslirp-dev \
	gdb-multiarch

RUN mkdir -p /opt/riscv

ENV PATH="$PATH:/opt/riscv/bin"

RUN cd riscv-gnu-toolchain && \
		./configure --prefix=/opt/riscv && \
		make linux

# Non RISCV-Tool-Chain Dependencies here + below
RUN apt install -y \
	vim 

RUN echo "echo 'Welcome! RISC-V tools are available at /opt/riscv/bin:'" >> ~/.bashrc
RUN echo "ls /opt/riscv/bin" >> ~/.bashrc
