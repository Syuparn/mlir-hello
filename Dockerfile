FROM ubuntu:22.04

RUN apt-get update -y && apt-get install -y python3 python3-pip cmake ninja-build curl wget software-properties-common

# Install LLVM/MLIR 18
# see https://apt.llvm.org/
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN apt-add-repository "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-18 main" && \
    apt-get update  && \
    apt-get install -y libllvm-18-ocaml-dev libllvm18 llvm-18 llvm-18-dev llvm-18-doc llvm-18-examples llvm-18-runtime libmlir-18-dev libmlir-18 mlir-18-tools

# install llvm-lit
RUN pip install lit==18.1.3

# build hello dialect
WORKDIR /mlir-hello
COPY . .
COPY llvm-lit build/bin/llvm-lit

WORKDIR /mlir-hello/build
RUN cmake -G Ninja .. -DLLVM_DIR=/lib/llvm-18/lib/cmake/llvm   -DMLIR_DIR=/lib/llvm-18/lib/cmake/mlir
RUN cmake --build . --target hello-opt

WORKDIR /mlir-hello
