
FROM python:2.7

RUN apt update
RUN apt install -y git libpcap-dev libnet-dev
RUN pip install cryptography libnacl gevent tabulate psutil dissect.cstruct==1.0.0
COPY MITRECND-pynids-03ec965/ /MITRECND-pynids-03ec965
Workdir /MITRECND-pynids-03ec965/libnids-1.25
RUN ./configure CFLAGS=-fPIC --disable-libglib --disable-libnet --disable-shared && make
RUN make install
Workdir /MITRECND-pynids-03ec965
RUN python setup.py build
RUN python setup.py install
COPY OpenSSH-Network-Parser /OpenSSH-Network-Parser
Workdir /OpenSSH-Network-Parser
RUN python setup.py build
RUN python setup.py install

CMD ["network-parser"]

