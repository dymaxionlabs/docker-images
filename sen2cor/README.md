# Sen2Cor Docker image

This is a Debian derived image containing the
[Sen2Cor](http://step.esa.int/main/third-party-plugins-2/sen2cor/) processor
for Sentinel-2 Level 2A product generation and formatting.

## Install

Run `sudo make` to install `sen2cor` wrapper script.  The Docker image will be
downloaded automatically when run for the first time.

## Usage

Just point `sen2cor` to a L1C product directory:

```
sen2cor ~/sen2/S2A_MSIL1C_20170504T140201_N0205_R024_T21HUB_20170504T140201.SAFE
```
