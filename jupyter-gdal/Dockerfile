ARG ROOT_CONTAINER=jupyter/minimal-notebook:python-3.10.11
FROM $ROOT_CONTAINER

LABEL maintainer="Damián Silvani <munshkr@gmail.com>"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

USER root

# ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	apt-transport-https \
	build-essential \
	ca-certificates \
	curl \
	file \
	gdal-bin \
	gnupg \
	libgdal-dev \
	libgl1 \
	libproj-dev \
	libspatialindex-dev \
	proj-bin \
	python3-dev \
	python3-venv \
	wget \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## Install gcloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
	&& apt-get update -y && apt-get install google-cloud-cli -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

## Install Orfeo Toolbox
ARG otb_version=8.1.1
ENV OTB_PACKAGE_NAME=OTB-${otb_version}-Linux64
# Install numpy (needed for OTB)
USER ${NB_UID}
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

USER ${NB_UID}

## Install python requirements
ADD requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip \
	&& pip install -r /tmp/requirements.txt

WORKDIR "${HOME}"
