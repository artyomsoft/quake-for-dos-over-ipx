# quake-for-dos-over-ipx
This multicontainer Docker application allows to run dedicated quake servers and [ipxbox](https://github.com/fragglet/ipxbox).

How to use:

1. Create your VPS based on Ubuntu 20.04 via VPS Hosting Provider GUI. 
2. Connect to the VPS via ssh or PuTTY.
3. Install *Docker* and *docker-compose*.
```
    $ apt update
    $ apt install docker.io
    $ curl -SL https://github.com/docker/compose/releases/download/v2.15.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
    $ ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    $ chmod +x /usr/local/bin/docker-compose
    $ systemctl enable docker
```    
4. Download *quake-for-dos-over-ipx*
```
    $ cd ~
    $ mkdir quake-servers 
    $ curl -SL https://github.com/artyomsoft/quake-for-dos-over-ipx/releases/download/v0.0.1/docker-compose.yml -o docker-compose.yml

```
5. Start *quake-for-dos-over-ipx*
```
    $ docker-compose up -d
```
6. Install [DOSBox Staging](https://dosbox-staging.github.io/) on your local machines you want to play the Quake from. Close DOSBox
7. Enable ipx in *%USERPROFILE%\AppData\Local\DOSBox\dosbox-staging.conf*
```
[ipx]
ipx = true
```
8. Add commands to autoexec in *%USERPROFILE%\AppData\Local\DOSBox\dosbox-staging.conf*. If DOS Quake is located in *c:\games\quake*, and your VPS address is *your.vps.address* it will be
```
[autoexec]
mount c: c:\games
c:
cd quake
ipxnet connect  10000
quake.exe -nocdaudio
```
