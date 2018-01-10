# Sen2Cor Docker image

This is a Debian derived image containing the
[Sen2Cor](http://step.esa.int/main/third-party-plugins-2/sen2cor/) processor
for Sentinel-2 Level 2A product generation and formatting.

## Install

Run `sudo make` to install `sen2cor` wrapper script.  The Docker image will be
downloaded automatically when run for the first time.

## Usage

### Wrapper script

Just point `sen2cor` to a L1C product directory:

```
sen2cor ~/sen2/S2A_MSIL1C_20170504T140201_N0205_R024_T21HUB_20170504T140201.SAFE
```

### Docker image

The entrypoint of this image runs the `L2A_Process.py` script.  Running the
container without any arguments will output its help:

```
docker run dymaxionlabs/sen2cor
```

All arguments passed to the image are passed as options to `L2A_Process.py`,
i.e. the following is equivalent to the previous invocation:

```
docker run dymaxionlabs/sen2cor --help
```

You must attach a volume where the L1C images are stored, and the L2A will be
generated. The image expects these to be on `/data`, so you must bind the
volume there. For example, if your L1C product is located at
`~/sen2/S2A_MSIL1C_20170504T140201_N0205_R024_T21HUB_20170504T140201.SAFE`, you
should run:

```
docker run --rm -ti -v ~/sen2:/data dymaxionlabs/sen2cor /data/S2A_MSIL1C_20170504T140201_N0205_R024_T21HUB_20170504T140201.SAFE
```
