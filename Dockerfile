FROM ubuntu:latest

WORKDIR /home

COPY ./asm.s .
COPY ./cpp.cpp .

RUN apt update && apt install -y g++ gcc-multilib

RUN g++ cpp.cpp -c -o cpp
RUN as asm.s -o asm
RUN g++ -no-pie cpp.cpp asm.s -o ca

