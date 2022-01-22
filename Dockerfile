FROM registry.access.redhat.com/ubi8/ubi:8.1
RUN sudo yum -y groupinstall 'Development Tools'
RUN sudo yum -y install openssl-devel git
RUN git clone https://github.com/wg/wrk.git
RUN cd wrk && make  && make WITH_LUAJIT=/usr WITH_OPENSSL=/usr
RUN sudo cp wrk /usr/local/bin/
WORKDIR /
