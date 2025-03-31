# zap2it

This is a docker image for running [daniel-widrick/zap2it-GuideScraping](https://github.com/daniel-widrick/zap2it-GuideScraping) in an automated way.

## Features
* Running of zap2it-GuideScrape.py
* Docker Compose examples
* Removal of historical xmlguide files
* [Healthcheck.io](https://healthchecks.io) integration
* Run once, or forever based on sleep time

## Environment Variables Options
* CONFIGFILE: [string]
  * Location of your config file.
  * default: `/data/zap2itconfig.ini`
* OUTPUTFILE: [string]
  * Location where you want the output file to be placed.
  * default: `/data/xmlguide.xmltv`
* HEALTHCHECK_URL: [string]
  * URL to ping when starting and ending the run.
  * default: `undefined`
* SLEEPTIME: [int]
  * Number of seconds to sleep before running again.
  * default: `undefined`

## Running

1. Create a `zap2itconfig.ini` file.  Check [daniel-widrick/zap2it-GuideScraping's](https://github.com/daniel-widrick/zap2it-GuideScraping) repo for more info on that. 
1. Make sure your output directory exists.  I `/data` for example.
1. Run the thing

### Only Once

#### docker cli
``` bash
docker run
  -v $(PWD)/data:/data
  -e CONFIGFILE=/data/zap2itconfig.ini
  -e OUTPUTFILE=/data/xmlguide.xmltv
  -e HEALTHCHECK_URL=https://hc-ping.com/UUID
  --user 1000:1000
  ghcr.io/vember31/zap2it:main
```
#### docker-compose.yml

``` yml
version: '3'
services:
  zap2it:
    image: ghcr.io/vember31/zap2it:main
    volumes:
      - ./data:/data
    environment:
      CONFIGFILE: "/data/zap2itconfig.ini"
      OUTPUTFILE: "/data/xmlguide.xmltv"
      HEALTHCHECK_URL: "https://hc-ping.com/UUID"
    user: "1000:1000"
```

### Running Continually

The only difference is adding the `SLEEPTIME` variable.

#### docker cli
``` bash
docker run
  -v $(PWD)/data:/data
  -e CONFIGFILE=/data/zap2itconfig.ini
  -e OUTPUTFILE=/data/xmlguide.xmltv
  -e HEALTHCHECK_URL=https://hc-ping.com/UUID
  -e SLEEPTIME=43200
  --user 1000:1000
  ghcr.io/vember31/zap2it:main
```
#### docker-compose.yml

``` yml
version: '3'
services:
  zap2it:
    image: ghcr.io/vember31/zap2it:main
    volumes:
      - ./data:/data
    environment:
      CONFIGFILE: "/data/zap2itconfig.ini"
      OUTPUTFILE: "/data/xmlguide.xmltv"
      HEALTHCHECK_URL: "https://hc-ping.com/UUID"
      SLEEPTIME: 43200
    user: "1000:1000"
```