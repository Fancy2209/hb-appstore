Specific instructions for building on various platforms are covered here!

### Building with Docker (Recommended, All Platforms)
The easiest way to build is using the [Sealeo](https://github.com/fortheusers/sealeo) docker container. It uses this [dependency helper script](https://github.com/fortheusers/sealeo/blob/main/dependency_helper.sh) to be able to build for all supported platforms. This is how the pre-compiled binaries are built.

1. Install [Docker](https://www.docker.com)
2. Run the following, replacing `make switch` with the target platform (one of `switch`, `wiiu`, `wii`, `3ds`, or `pc`):
```
git clone --recursive https://github.com/fortheusers/hb-appstore.git
cd hb-appstore
docker run -v $(pwd):/code -it ghcr.io/fortheusers/sealeo /bin/bash
make switch    # or wiiu, wii, 3ds, pc
```

Depending on which platform you chose, `appstore.nro` or `appstore.rpx` should now be sitting in the cloned directory. When building for Wii U, an `appstore.wuhb` file will also be present.


## Building for Wii U (with WUT)
1. Install [dkp-pacman](https://devkitpro.org/viewtopic.php?f=13&t=8702)
2. Install devkitPPC and needed Wii U dependencies via dkp-pacman:
```
sudo dkp-pacman -S wut wiiu-sdl2 devkitPPC wiiu-sdl2_gfx wiiu-sdl2_image wiiu-sdl2_ttf wiiu-sdl2_mixer ppc-zlib ppc-bzip2 ppc-freetype ppc-mpg123 ppc-libpng ppc-pkg-config wiiu-pkg-config wut-tools wut wiiu-curl
```
3. *If on macOS*: install gtar with: `brew install gnu-tar` (needed by resinfs)
4. Once the environment is setup:
```
git clone --recursive https://github.com/fortheusers/hb-appstore.git
cd hb-appstore
make wiiu
```

If all goes well, `appstore.rpx` and `appstore.wuhb` should be sitting in the current directory.


## Building for Switch (with libnx)
1. Install [dkp-pacman](https://devkitpro.org/viewtopic.php?f=13&t=8702)
2. Install devkitA64 and needed Switch dependencies via dkp-pacman:
```
sudo dkp-pacman -S devkitA64 libnx switch-tools switch-curl switch-bzip2 switch-freetype switch-libjpeg-turbo switch-libwebp switch-sdl2 switch-sdl2_gfx switch-sdl2_image switch-sdl2_ttf switch-sdl2_mixer switch-zlib switch-libpng switch-mesa
```
3. *If on macOS*: install gtar with: `brew install gnu-tar` (needed by resinfs)
4. Once it's all setup, recursively clone the repo and run make:
```
git clone --recursive https://github.com/fortheusers/hb-appstore.git
cd hb-appstore
make switch
```

If all goes well, `appstore.nro` should be sitting in the current directory.


## Building for Wii (with libogc)
1. Install [dkp-pacman](https://devkitpro.org/viewtopic.php?f=13&t=8702)
2. Install devkitPPC and needed Wii dependencies via dkp-pacman:
```
sudo dkp-pacman -S devkitPPC libogc gamecube-tools ppc-zlib ppc-bzip2 ppc-freetype ppc-mpg123 ppc-libpng ppc-pkg-config ppc-libvorbisidec ppc-libjpeg-turbo libfat-ogc wii-sdl2 wii-sdl2_gfx wii-sdl2_image wii-sdl2_ttf wii-sdl2_mixer

```
3. *If on macOS*: install gtar with: `brew install gnu-tar` (needed by resinfs)
4. Once it's all setup, recursively clone the repo and run make:
```
git clone --recursive https://github.com/fortheusers/hb-appstore.git
cd hb-appstore
make wii
```

If all goes well, `appstore.dol` should be sitting in the current directory.


## Building for 3DS (with libctru)
1. Install [dkp-pacman](https://devkitpro.org/viewtopic.php?f=13&t=8702)
2. Install devkitARM and needed 3DS dependencies via dkp-pacman:
```
sudo dkp-pacman -S 3ds-sdl 3ds-sdl_image 3ds-sdl_mixer 3ds-sdl_gfx 3ds-sdl_ttf libctru citro3d 3dstools 3ds-curl 3ds-mbedtls
```
3. *If on macOS*: install gtar with: `brew install gnu-tar` (needed by resinfs)
4. Once it's all setup, recursively clone the repo and run make:
```
git clone --recursive https://github.com/fortheusers/hb-appstore.git
cd hb-appstore
make 3ds
```

If all goes well, `appstore.3dsx` should be sitting in the current directory.


## Building for PC
Below instructions are for Ubuntu, but should be similar on other platforms.

Both targets support the addition of `CFLAGS += -D_3DS_MOCK` in the Makefile to build a version that uses 3DS dimensions and layout logic for the window size.

The following produces `appstore.bin` in the current directory:
```
sudo apt-get install libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libsdl2-gfx-dev zlib1g-dev gcc g++ libcurl4-openssl-dev
git clone --recursive https://github.com/fortheusers/hb-appstore.git
cd hb-appstore
make pc
```

### Windows Dependencies
See the [build_pc.sh](https://github.com/fortheusers/chesto/blob/main/helpers/build_pc.sh#L29-L35) script for info on how to install msys2 and mingw64 dependencies.