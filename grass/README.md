# GRASS Docker image

This is a Debian derived image containing [GRASS GIS](http://grass.osgeo.org/)
software.

## Usage

Running the container without any arguments will output the grass help:

    docker run dymaxionlabs/grass

All arguments passed to the image are passed as options to grass, i.e. the
following is equivalent to the previous invocation:

    docker run dymaxionlabs/grass --help

You will most likely want to work with data on the host system from within the
docker container, in which case run the container with the `-v` option along
the following lines:

    docker run -it --rm -v $(pwd):/data dymaxionlabs/grass -c /data/grassdb/here

The above command will create, in the current working directory on the host,
the GRASS database `grassdb` and the GRASS location `here` with the default
GRASS mapset of `PERMANENT`.

Running the following command in the future **from the same current working
directory** will allow you to continue working with the data:

    docker run -it --rm -v $(pwd):/data dymaxionlabs/grass /data/grassdb/here/PERMANENT

This works because the current working directory is set to `/data` in the
container, and you have mapped the current working directory on your host to
`/data`.
