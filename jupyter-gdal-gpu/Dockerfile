ARG ROOT_CONTAINER=nvidia/cuda:11.5.1-runtime-ubuntu20.04
FROM $ROOT_CONTAINER

LABEL maintainer="Damián Silvani <munshkr@gmail.com>"
ARG NB_USER=app
ARG NB_UID=1000
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	file \
	gdal-bin \
	libcudnn8 \
	libgdal-dev \
	libproj-dev \
	libspatialindex-dev \
	proj-bin \
	python3 \
	python3-dev \
	python3-pip \
	python3-setuptools \
	libgl1 \
	wget \
	&& pip install --upgrade pip \
	&& useradd -l -m -s /bin/bash -N -u "${NB_UID}" "${NB_USER}"

## Install gcloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
	&& apt-get update -y && apt-get install google-cloud-cli -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## Install Orfeo Toolbox
ARG otb_version=8.1.0
ENV OTB_PACKAGE_NAME=OTB-${otb_version}-Linux64
# Install numpy (needed for OTB)
USER ${NB_USER}
RUN pip install --upgrade pip \
	&& pip install numpy
# Download and run OTB setup
USER root
WORKDIR /opt
RUN wget -q https://www.orfeo-toolbox.org/packages/archives/OTB/$OTB_PACKAGE_NAME.run \
	&& chmod +x ./$OTB_PACKAGE_NAME.run \
	&& ./$OTB_PACKAGE_NAME.run \
	&& rm -f $OTB_PACKAGE_NAME.run \
	&& ln -s /opt/$OTB_PACKAGE_NAME /opt/OTB

## Install Python requirements
USER ${NB_USER}
ADD requirements.txt /tmp/requirements.txt
ENV PATH=/home/${NB_USER}/.local/bin:${PATH}
RUN pip install -r /tmp/requirements.txt

WORKDIR /home/${NB_USER}

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
# CMD ["jupyter lab --ip=0.0.0.0"]
CMD ["/usr/local/bin/entrypoint.sh"]
