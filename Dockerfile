FROM d3v0x/gentoo

RUN emerge-webrsync -v
RUN echo "MAKEOPTS=\"-j$(cat /proc/cpuinfo | grep processor | wc -l)\"" >> /etc/portage/make.conf
RUN cat /etc/portage/make.conf

RUN emerge =dev-db/mongodb-2.6.8
RUN rm -rf /usr/portage

EXPOSE 27017

CMD usr/bin/mongod --dbpath /dbdata