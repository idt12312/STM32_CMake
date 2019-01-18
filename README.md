# CMake example project for STM32 and CubeMX

This repository contains code examples that show 
how to compile source codes for STM32 and CubeMX with CMake.

## Requirements

* Hardware: STM32F4Dicovery
* Compiler: arm-none-eabi-gcc ver 7.2.1
* CMake: CMake ver 3.9.6

Even in versions of tools are different from avobe, it may work well.


## About source code in this repository

Fundamentals of these source codes are generated with CubeMX.   
To show how to add libraries and add C++ codes, 
I add codes under TestLibrary directory and Src/test_cpp.cpp and Inc/test_cpp.h.  
This project link CMSIS DSP library, so you can functions in the library.

You build this project and execute on STM32F4Discovery, and then the LED on the board will blink.


## Build

Execute following commands in youre terminal.

```sh
mkdir build
cd build
cmake  -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=arm-none-eabi-gcc_toolchain.cmake ..  
make
```

Above is for Debug build.
If you use Release build, execute following.

```sh
cmake  -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=arm-none-eabi-gcc_toolchain.cmake ..  
```

On Linux, CMake will generate a makefile. 
And on Windows, it will generate a project file for visual studio.
Using cmake -G option with CMake, it can generate some build file (for make, Ninja, VisualStudio, Xcode, Eclipse, ...).

cmake-generators(7)  
https://cmake.org/cmake/help/v3.0/manual/cmake-generators.7.html