FROM debian:stretch
MAINTAINER Damián Silvani <damian@dymaxionlabs.com>

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gdal-bin \
        libgdal-dev \
        libxmu6 \
        libxpm4 \
        libxt6 \
        musl \
        python \
        python-gdal \
        python-pyproj \
    && rm -rf /var/lib/apt/lists/*

ENV SEN2COR_DOWNLOAD_URL "http://step.esa.int/thirdparties/sen2cor/2.5.5/Sen2Cor-02.05.05-Linux64.run"
ENV SEN2COR_DOWNLOAD_HASH f8130411cb628507d2087076d392aee29982a38b50bd1f44ce31507d26923ce3
ENV SEN2COR_INSTALLER "Sen2Cor.run"

RUN useradd -ms /bin/bash user && \
    mkdir /opt/sen2cor && \
    chown user /opt/sen2cor

USER user
WORKDIR /home/user

RUN curl -o ${SEN2COR_INSTALLER} -sSL ${SEN2COR_DOWNLOAD_URL} && \
    echo "$SEN2COR_DOWNLOAD_HASH $SEN2COR_INSTALLER" | sha256sum -c - && \
    bash ${SEN2COR_INSTALLER} --target /opt/sen2cor && \
    rm ${SEN2COR_INSTALLER}

COPY src/entrypoint.sh /usr/local/bin

VOLUME /data

ENV SEN2COR_PATH=/opt/sen2cor \
    SEN2COR_HOME=/home/user/sen2cor

ENV SEN2COR_BIN=$SEN2COR_PATH/lib/python2.7/site-packages/sen2cor \
    PATH=$SEN2COR_PATH/bin:${PATH} \
    LD_LIBRARY_PATH=$SEN2COR_PATH/lib:${LD_LIBRARY_PATH} \
    PYTHONPATH=$SEN2COR_PATH/lib/python2.7:${PYTHONPATH} \
    GDAL_DATA=$SEN2COR_PATH/share/gdal \
    GDAL_DRIVER_PATH=disable \
    LC_NUMERIC=C

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
