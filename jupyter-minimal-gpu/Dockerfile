ARG ROOT_CONTAINER=nvidia/cuda:11.5.1-runtime-ubuntu20.04
FROM $ROOT_CONTAINER

LABEL maintainer="Damián Silvani <munshkr@gmail.com>,Xavier Petit <nuxion@gmail.com>"
ARG NB_USER=app
ARG NB_UID=1000
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y python3 python3-pip python3-setuptools \
	&& pip install --upgrade pip \
	&& useradd -l -m -s /bin/bash -N -u "${NB_UID}" "${NB_USER}"

USER ${NB_USER}
ADD requirements.txt /tmp/requirements.txt
env PATH=/home/${NB_USER}/.local/bin:${PATH}
RUN pip install -r /tmp/requirements.txt
WORKDIR /home/${NB_USER}
ADD entrypoint.sh /usr/local/bin/entrypoint.sh
# CMD ["jupyter lab --ip=0.0.0.0"]
CMD ["/usr/local/bin/entrypoint.sh"]
