FROM --platform=${TARGETPLATFORM:-linux/amd64} python:3.10

ENV BUILD_DIR=/tmp/tensorflow

ADD tensorflow-2.15.0.tar.xz ${BUILD_DIR}

ADD scripts/install_packages.sh .

RUN ./install_packages.sh

WORKDIR ${BUILD_DIR} 

ADD scripts/build.sh ${BUILD_DIR}

ENTRYPOINT ["./build.sh"]

